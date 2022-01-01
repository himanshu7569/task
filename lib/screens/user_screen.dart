import 'package:aman_task/screens/thankyou_screen.dart';
import 'package:aman_task/utils/shared_preferences_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

///
/// Validation and Custom Input widgets will be used for production
class _UserFormScreenState extends State<UserFormScreen> {
  // Can be shifted to dataModel Classes for modularization
  String _userName = "";
  String _mobile = "";
  String _email = "";
  String _address = "";

  _saveDetails() {
    if (_validationCheck()) {
      SharedPreferencesHelper().setFormFilled(true);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ThankYouScreen()));
    }
  }

  bool _validationCheck() {
    bool result = true;

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TST_Tech_test"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "User Info Form",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              decoration: const InputDecoration(hintText: "User Name"),
              onChanged: (value) => {_userName = value},
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Mobile"),
              onChanged: (value) => {_mobile = value},
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Email"),
              onChanged: (value) => {_email = value},
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Address"),
              onChanged: (value) => {_address = value},
            ),
            OutlinedButton(onPressed: _saveDetails, child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}
