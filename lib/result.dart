import 'package:flutter/material.dart';
import 'userModel.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  User model;

  Result({required this.model});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('Updated Model Values'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'First Name: ' + model.firstName,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'Last Name: ' + model.lastName,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'DOB: ' + model.dateOfBirth,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'Email: ' + model.email,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'Address: ' +
                  model.streetNo +
                  ' ' +
                  model.streetName +
                  ' ' +
                  model.suburb +
                  ' ' +
                  model.postcode,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'Password: ' + model.password,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    ));
  }
}
