//Create form stateful widget
import 'package:flutter/material.dart';
import 'package:form_validation/models/userModel.dart';
import 'package:form_validation/models/validators.dart';
import 'package:form_validation/views/result.dart';

import 'myTextFormField.dart';

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  //Give the form stateful widget a global key
  final _formKey = GlobalKey<FormState>();
  //Create an instance of the model model and make all values a string
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

  RegExp emailRegEx = new RegExp(validEmailKey);
  RegExp passwordRegex = new RegExp(validPasswordKey);
  RegExp numberCheckRegex = new RegExp(checkForNumberKey);
  RegExp numberCheckL4Regex = new RegExp(checkForNumberL4Key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: MyTextFormField(
                    hintText: 'First Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.firstName = value;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: MyTextFormField(
                    hintText: 'Last Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.lastName = value;
                    },
                  ),
                )
              ],
            ),
          ),
          MyTextFormField(
            hintText: "Date of Birth 'DD/MM/YYYY'",
            isPassword: false,
            validator: (String value) {
              if (value.length < 7) {
                return 'Invalid Date of birth';
              }
              _formKey.currentState!.save();
              return null;
            },
            onSaved: (String value) {
              model.dateOfBirth = value;
            },
          ),
          MyTextFormField(
            hintText: 'Email',
            isEmail: true,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter email';
              } else {
                if (!emailRegEx.hasMatch(value)) {
                  return 'Please enter valid email';
                } else {
                  _formKey.currentState!.save();
                  return null;
                }
              }
            },
            onSaved: (String value) {
              model.email = value;
            },
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: MyTextFormField(
                    hintText: 'No',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Empty';
                      } else {
                        if (!numberCheckRegex.hasMatch(value)) {
                          return '#';
                        }
                      }
                      _formKey.currentState!.save();
                      return null;
                    },
                    onSaved: (String value) {
                      model.streetNo = value;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: MyTextFormField(
                    hintText: 'Street Name',
                    validator: (String value) {
                      if (value.length < 4) {
                        return 'Street Name is invalid';
                      }
                      _formKey.currentState!.save();
                      return null;
                    },
                    onSaved: (String value) {
                      model.streetName = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextFormField(
                    hintText: 'Suburb',
                    validator: (String value) {
                      if (value.length < 4) {
                        return 'Suburb is invalid';
                      }
                      _formKey.currentState!.save();
                      return null;
                    },
                    onSaved: (String value) {
                      model.suburb = value;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: MyTextFormField(
                    hintText: 'Postcode',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter postcode';
                      } else {
                        if (!numberCheckL4Regex.hasMatch(value)) {
                          return 'Must be numbers';
                        }
                      }
                      _formKey.currentState!.save();
                      return null;
                    },
                    onSaved: (String value) {
                      model.postcode = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          MyTextFormField(
            hintText: 'Password',
            isPassword: true,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter password';
              } else {
                if (!passwordRegex.hasMatch(value)) {
                  return 'Please enter valid password';
                } else {
                  _formKey.currentState!.save();
                  return null;
                }
              }
            },
            onSaved: (String value) {
              model.password = value;
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(model: this.model)));
              }
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
