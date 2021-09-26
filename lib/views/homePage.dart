import 'package:flutter/material.dart';

//Crate a stateless widget class for the home page
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  //create a widget
  Widget build(BuildContext context) {
    //Make the widget a material app
    return MaterialApp(
      //set its home variable to a scaffold (when the user indicates a back input, it will return to this page from now on)
      home: Scaffold(
        //give the page an app bar
        appBar: AppBar(
          //give the appbar a title of Home Page
          title: Text('Home Page'),
        ),
        //set its body variable to an empty container to later contain the rest of the app
        body: Container(),
      ),
    );
  }
}
