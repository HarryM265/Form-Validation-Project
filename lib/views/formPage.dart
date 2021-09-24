import 'package:flutter/material.dart';
import 'package:form_validation/widgets/profileForm.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Validation Project')),
      body: ListView(
        children: [ProfileForm()],
      ),
    );
  }
}
