String checkForNumberKey = r'(?=.*?[0-9])';
String checkForNumberL4Key = r'(?=.*?[0-9]).{4,}';
String validEmailKey =
    r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
String validPasswordKey =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
