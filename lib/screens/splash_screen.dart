import 'dart:async';

import 'package:aman_task/screens/thankyou_screen.dart';
import 'package:aman_task/screens/user_screen.dart';
import 'package:aman_task/utils/shared_preferences_helper.dart';
import 'package:aman_task/utils/work_manager.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workmanager/workmanager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferencesHelper _sharedPreferencesHelper =
      SharedPreferencesHelper();

  // Hold and Navigate
  _holdAndNavigate() async {
    bool isFilled = await _sharedPreferencesHelper.isFormFilled();
    Timer(
        const Duration(seconds: 1),
        () => {
              if (isFilled)
                {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThankYouScreen()))
                }
              else
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserFormScreen()))
                }
            });
  }

  void _registerTask() async {
    Workmanager().registerPeriodicTask("1", repeatTwoHour,
        frequency: const Duration(hours: 2));

    // TODO calculate initial delay to start task at 2PM
    Workmanager().registerPeriodicTask("2", uploadData,
        frequency: const Duration(days: 1));

    Workmanager().registerOneOffTask("3", getContacts);
  }

  // Check for permission
  // Only small check are added
  _checkPermissions() async {
    var contactPStatus = await Permission.contacts.status;
    var smsPStatus = await Permission.sms.status;
    var locationPStatus = await Permission.locationAlways.status;
    if (contactPStatus.isDenied) {
      await Permission.contacts.request();
    }
    if (smsPStatus.isDenied) {
      await Permission.sms.request();
    }
    if (locationPStatus.isDenied) {
      await Permission.locationAlways.request();
    }
    _registerTask();
    _holdAndNavigate();
  }

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Text("Task App"),
          ],
        ),
      ),
    );
  }
}
