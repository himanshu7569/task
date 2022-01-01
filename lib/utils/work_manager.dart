import 'package:aman_task/contacts.dart';
import 'package:aman_task/location.dart';
import 'package:aman_task/sqlite_database/sqlite_database_helper.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';

const repeatTwoHour = 'repeatTwoHour';
const uploadData = 'uploadData';
const getContacts = 'getContacts';

///
/// Advanced usecase i.e. sync not able to complete or internet not availabe not
/// handled for this task
///
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    switch (taskName) {
      case repeatTwoHour:
        bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
        var locationPermission = await Geolocator.checkPermission();
        if (serviceEnabled &&
            (locationPermission != LocationPermission.denied ||
                locationPermission != LocationPermission.deniedForever)) {
          var location = await Geolocator.getCurrentPosition();
          await DBHelper.instance.createLocationEntry(Location(
              long: location.longitude.toString(),
              lat: location.latitude.toString()));
        }
        break;
      case uploadData:

        break;
      case getContacts:
        // It will upload duplicate contacts too
        List<Contact> contacts = await ContactsService.getContacts();
        // Not optimized for the task
        for (int i = 0; i < contacts.length; i++) {
          // Can be shifted for update many
          await DBHelper.instance.createContactEntry(ContactLocal(
              name: contacts[i].displayName ?? "NA",
              number: contacts[i].phones![i].value ?? "NA"));
        }
        break;
    }
    return Future.value(true);
  });
}
