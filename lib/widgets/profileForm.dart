//Create form stateful widget
import 'package:flutter/material.dart';
import 'package:form_validation/models/userModel.dart';
import 'package:form_validation/models/validators.dart';
import 'package:form_validation/views/result.dart';
import 'myTextFormField.dart';

//create stateless widget class called profile form
class ProfileForm extends StatefulWidget {
  @override
  //create a profile form state
  _ProfileFormState createState() => _ProfileFormState();
}

//make profile form state extend the state of the profile form class
class _ProfileFormState extends State<ProfileForm> {
  //Give the form stateful widget a global key
  final _formKey = GlobalKey<FormState>();
  //Create an instance of the User model and make all values an empty string
  User model = User(
    email: '',
    firstName: '',
    lastName: '',
    password: '',
    dateOfBirth: '',
    streetNo: '',
    streetName: '',
    suburb: '',
    postcode: '',
  );

  //Create regular expressions based on validators
  RegExp emailRegEx = new RegExp(validEmailKey); //email expression
  RegExp passwordRegex = new RegExp(validPasswordKey); //password expression
  RegExp numberCheckRegex =
      new RegExp(checkForNumberKey); //check for number expression
  RegExp numberCheckL4Regex =
      new RegExp(checkForNumberL4Key); //check for number of length 4 expression

  @override
  //create widget
  Widget build(BuildContext context) {
    //make the widget a form widget
    return Form(
      //set the formkey to _formkey
      key: _formKey,
      //set the child variable to a column widget
      child: Column(
        children: <Widget>[
          //return a container child
          Container(
            //align the container to the top center of the y-axis
            alignment: Alignment.topCenter,
            //set the child variable to a row
            child: Row(
              //align the row ti the start of the x-axis
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //return a container child
                Container(
                  //align the container to the top center of the screen
                  alignment: Alignment.topCenter,
                  //set container width to half the screen size
                  width: MediaQuery.of(context).size.width * 0.5,
                  //set the child variable to my custom text form field
                  child: MyTextFormField(
                    //set the hint text to First Name
                    hintText: 'First Name',
                    //set the validator to check if the value is empty
                    validator: (String value) {
                      if (value.isEmpty) {
                        //if not valid reurn Enter your first name
                        return 'Enter your first name';
                      }
                      return null;
                    },
                    //when saved store the value as the first name of the user model
                    onSaved: (String value) {
                      model.firstName = value;
                    },
                  ),
                ),
                //return a container child
                Container(
                  //align the container to the to center of the screen
                  alignment: Alignment.topCenter,
                  //set the width of the container to half screen width
                  width: MediaQuery.of(context).size.width * 0.5,
                  //set the child variable to my custom text form field
                  child: MyTextFormField(
                    //set the hint text to last name
                    hintText: 'Last Name',
                    //set the validator to check if the value it empty
                    validator: (String value) {
                      if (value.isEmpty) {
                        //if not valid return Enter your last name
                        return 'Enter your last name';
                      }
                      return null;
                    },
                    //when saved store the value as the last name of the user model
                    onSaved: (String value) {
                      model.lastName = value;
                    },
                  ),
                )
              ],
            ),
          ),
          //return my custom text form field
          MyTextFormField(
            //set the hint text variable to Date of Birth 'DD/MM/YYY'
            hintText: "Date of Birth 'DD/MM/YYYY'",
            //set the password boolean to false
            isPassword: false,
            //check the value is less than 7 characters long
            validator: (String value) {
              if (value.length < 7) {
                //if not valid return Invalid date of birth
                return 'Invalid Date of birth';
              }
              _formKey.currentState!.save();
              return null;
            },
            //when saved store the value as the date of birth of the user model
            onSaved: (String value) {
              model.dateOfBirth = value;
            },
          ),
          //return my custom text form field
          MyTextFormField(
            //set the hint text to email
            hintText: 'Email',
            //set the isEmail boolean to true
            isEmail: true,
            //check if the value is empty
            validator: (String value) {
              if (value.isEmpty) {
                //if empty return please enter email
                return 'Please enter email';
              } else {
                //check if value is a valid email
                if (!emailRegEx.hasMatch(value)) {
                  //if not valid return please enter valid email
                  return 'Please enter valid email';
                } else {
                  _formKey.currentState!.save();
                  return null;
                }
              }
            },
            //when saved store the value as the user email model value
            onSaved: (String value) {
              model.email = value;
            },
          ),
          //create a container
          Container(
            //align container to top centre of the screen
            alignment: Alignment.topCenter,
            //set the child variable to a row
            child: Row(
              //align the widget to the start of the y-axis
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //create a container
                Container(
                  //align container to the top centre of the screen
                  alignment: Alignment.topCenter,
                  //set container width to 1/5 of the screen size
                  width: MediaQuery.of(context).size.width * 0.2,
                  //set the child variable to my custom text form field class
                  child: MyTextFormField(
                    //set the hint text to No (short for number)
                    hintText: 'No',
                    //check if value is empty
                    validator: (String value) {
                      if (value.isEmpty) {
                        //if empty return empty
                        return 'Empty';
                      } else {
                        //check if the value contains numbers
                        if (!numberCheckRegex.hasMatch(value)) {
                          //if not valid return # (shortened for sizing purposes)
                          return '#';
                        }
                      }
                      _formKey.currentState!.save();
                      return null;
                    },
                    //when saved store the value as the streetNo user model value
                    onSaved: (String value) {
                      model.streetNo = value;
                    },
                  ),
                ),
                //create container
                Container(
                  //align container with the top centre of the screen
                  alignment: Alignment.topCenter,
                  //set container width to 4/5 of the screen
                  width: MediaQuery.of(context).size.width * 0.8,
                  //set the child variable to my custom text form field
                  child: MyTextFormField(
                    //set the hint text to Street Name
                    hintText: 'Street Name',
                    //check if the value is less than 4 characters long
                    validator: (String value) {
                      if (value.length < 4) {
                        //if not valid return street name is invalid
                        return 'Street Name is invalid';
                      }
                      _formKey.currentState!.save();
                      return null;
                    },
                    //when saved store the value as user streetname value
                    onSaved: (String value) {
                      model.streetName = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          //create container
          Container(
            //align container contents with the top centre of the widget
            alignment: Alignment.topCenter,
            //set the child variable to a row widget
            child: Row(
              //set the widget to sit at the start of the y-axis
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //create container
                Container(
                  //align container to the top centre of the widget
                  alignment: Alignment.topCenter,
                  //set the width to 3/5 of the screen width
                  width: MediaQuery.of(context).size.width * 0.6,
                  //set the child variable to my custom text form field
                  child: MyTextFormField(
                    //set the hint text to suburb
                    hintText: 'Suburb',
                    //check if the value is less than 4 characters long
                    validator: (String value) {
                      if (value.length < 4) {
                        //if the value is less than 4 characters long return suburb is invalid
                        return 'Suburb is invalid';
                      }
                      _formKey.currentState!.save();
                      return null;
                    },
                    //when saved store the value as the suburb user model value
                    onSaved: (String value) {
                      model.suburb = value;
                    },
                  ),
                ),
                //create container
                Container(
                  //align container with the top centre of the widget
                  alignment: Alignment.topCenter,
                  //set the width to 2/5 of the screen width
                  width: MediaQuery.of(context).size.width * 0.4,
                  //set the child variable to my custom text form field
                  child: MyTextFormField(
                    //set the hint text as postcode
                    hintText: 'Postcode',
                    //check if the value is empty
                    validator: (String value) {
                      if (value.isEmpty) {
                        //if empty return please enter postcode
                        return 'Please enter postcode';
                      } else {
                        //check if value is not a number or is longer than 4 characters long
                        if (!numberCheckL4Regex.hasMatch(value)) {
                          //if invlaid return must be numbers
                          return 'Must be numbers';
                        }
                      }
                      _formKey.currentState!.save();
                      return null;
                    },
                    //when saved store the value as the postcode user model value
                    onSaved: (String value) {
                      model.postcode = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          //create my custom text form field
          MyTextFormField(
            //set hint text to password
            hintText: 'Password',
            //set isPassword boolean to true
            isPassword: true,
            //check if value is valid
            validator: (String value) {
              //check if value is empty
              if (value.isEmpty) {
                //if empty return please enter password
                return 'Please enter password';
              } else {
                //check if the value does not match the password validator
                if (!passwordRegex.hasMatch(value)) {
                  //if invalid return please enter password
                  return 'Please enter valid password';
                } else {
                  _formKey.currentState!.save();
                  return null;
                }
              }
            },
            //when saved store the value as user model password value
            onSaved: (String value) {
              model.password = value;
            },
          ),
          //create an elevated button
          ElevatedButton(
            //style the button
            style: ButtonStyle(
                //make the button blue
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: () {
              //when button is pressed check if the values are valid
              if (_formKey.currentState!.validate()) {
                //TODO try removing validate call from above code
                //if valid store the values
                _formKey.currentState!.save();
                //and navigate to the result page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        //making the result page reflect the stored values
                        builder: (context) => Result(model: this.model)));
              }
            },
            //Title the button as sign up
            child: Text(
              'Sign Up',
              style: TextStyle(
                //set button to white
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
