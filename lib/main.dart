import 'package:flutter/material.dart';
import 'profileForm.dart';

void main() {
  //Run the form validaton app
  runApp(FormValidationProject());
}

//Create form validation stateless widget
class FormValidationProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Make a material app
    return MaterialApp(
      home: Scaffold(
        //Give the app an appbar
        appBar: AppBar(
          title: Text('Form Validation Project'),
        ),
        //Fill the screen with the form stateful widget made below
        body: ListView(
          children: [ProfileForm()],
        ),
      ),
    );
  }
}
