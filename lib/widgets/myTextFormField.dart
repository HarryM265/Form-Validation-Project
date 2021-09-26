import 'package:flutter/material.dart';

//create a class for a custom text form field stateless widget
class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function? validator;
  final Function? onSaved;
  final bool isPassword;
  final bool isEmail;

//create a constructor for the above class
  MyTextFormField({
    required this.hintText,
    required this.validator,
    required this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  //create widget
  Widget build(BuildContext context) {
    //return a padding widget
    return Padding(
      //set the padding to all edges at 8 pixels
      padding: EdgeInsets.all(8.0),
      //set the child variable to a text form field
      child: TextFormField(
        //give the text form field decoration
        decoration: InputDecoration(
          //set the hint text to the custom variable
          hintText: hintText,
          //set more padding on all edges at 15 pixels
          contentPadding: EdgeInsets.all(15.0),
          //set no border
          border: InputBorder.none,
          //set filled to true
          filled: true,
          //set the fill colour to light grey
          fillColor: Colors.grey[200],
        ),
        //use above password boolean to obscure text
        obscureText: isPassword ? true : false,
        //check each value is valid
        validator: (value) => validator!(value),
        //on saved store all values
        onSaved: (value) => onSaved!(value),
        //use above email boolean to set keyboard type as email (giving the user an @ symbol)
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
