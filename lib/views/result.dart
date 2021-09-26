import 'package:flutter/material.dart';
import 'package:form_validation/models/userModel.dart';
import 'homePage.dart';

//create a stateless widget class for the Result page
// ignore: must_be_immutable
class Result extends StatelessWidget {
  //call a model extending the User class
  User model;

  //Call the result class and make all variables required
  Result({required this.model});

  @override
  //create a widget
  Widget build(BuildContext context) {
    //Make the widget a scaffold
    return (Scaffold(
      //give the widget an appbar
      appBar: AppBar(
        //title the appbar to Updated Model Values
        title: Text('Updated Model Values'),
      ),
      //set the body variable to a container
      body: Container(
        //give all elements within the container an inset of 10 pixels
        margin: EdgeInsets.all(10.0),
        //set the child varaible to a column
        child: Column(
          //set the children to render at the beginning of the x-axis
          crossAxisAlignment: CrossAxisAlignment.start,
          //create text boxes to return the stored model values
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
            //create a container
            Container(
              //align the elements of the container with the center of the screen
              alignment: Alignment.center,
              //set the child varaible to an elevated button
              child: ElevatedButton(
                  //when pressed button will navigate the user to the home page
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
                  //title the button as confirm
                  child: Text('Confirm')),
            )
          ],
        ),
      ),
    ));
  }
}
