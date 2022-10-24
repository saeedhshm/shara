

class Validator{
  static bool validateEmail(String email){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

    return !emailValid;
  }

  static bool validatePhone(int phone){
    bool phoneIsValid = RegExp(r"^[5]\d{8,}$").hasMatch("$phone");

    return phoneIsValid;
  }
}