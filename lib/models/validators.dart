//Define strings for later use in validations

//validate the value contains numbers
String checkForNumberKey = r'(?=.*?[0-9])';
//validate the value contains numbers and is 4 characters long
String checkForNumberL4Key = r'(?=.*?[0-9]).{4,}';
//validate the value contains email attributes
String validEmailKey =
    r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
//validate the value contains password attributes and a minimum of 8 characters long
String validPasswordKey =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
