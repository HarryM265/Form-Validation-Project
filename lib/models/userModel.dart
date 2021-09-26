//Create a class defining user attributes
class User {
  String firstName;
  String lastName;
  String dateOfBirth;
  String email;
  String streetNo;
  String streetName;
  String suburb;
  String postcode;
  String password;

//Create a constructor for the User class, making all variables required
  User(
      {required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.email,
      required this.streetNo,
      required this.streetName,
      required this.suburb,
      required this.postcode,
      required this.password});
}
