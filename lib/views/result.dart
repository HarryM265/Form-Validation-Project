import 'package:flutter/material.dart';
import 'package:form_validation/library.dart';

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
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Last Name: ' + model.lastName,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'DOB: ' + model.dateOfBirth,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Email: ' + model.email,
              style: TextStyle(fontSize: 18),
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
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Password: ' + model.password,
              style: TextStyle(fontSize: 18),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  },
                  child: Text('Confirm')),
            )
          ],
        ),
      ),
    ));
  }
}
