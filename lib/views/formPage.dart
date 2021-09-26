import 'package:flutter/material.dart';
import 'package:form_validation/widgets/profileForm.dart';

//create a stateless widget class for the form page
class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  //create the widget
  Widget build(BuildContext context) {
    //make the widget a scaffold
    return Scaffold(
      //give the page an appbar titled: form validation project
      appBar: AppBar(title: Text('Form Validation Project')),
      //Make the widget a listview to extend its boundaries beyond screen height
      body: ListView(
        //Return the profile form widget within the listview
        children: [ProfileForm()],
      ),
    );
  }
}
