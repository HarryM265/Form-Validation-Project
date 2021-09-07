class User {
  String firstName;
  String lastName;
  String dateOfBirth;
  String email;
  //Address rework needs to be done
  String streetNo;
  String streetName;
  String suburb;
  String postcode;
  String password;

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
