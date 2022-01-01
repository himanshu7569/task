import 'package:flutter/material.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TST_Tech_test"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Thank You"),
      ),
    );
  }
}
