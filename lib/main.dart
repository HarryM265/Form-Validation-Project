import 'package:flutter/material.dart';
import 'views/formPage.dart';

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
        //Fill the screen with the FormPage widget
        body: FormPage(),
      ),
    );
  }
}
