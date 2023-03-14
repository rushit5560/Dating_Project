
class FieldValidator {

  String? validateMobileNumber(String value) {
    if (value.isEmpty) {
      return 'Mobile number is required.';
    } else if (value.length < 10) {
      return 'Enter at least 10 digit mobile number.';
    } else if (value == "0000000000") {
      return 'Please enter valid mobile number.';
    }
    return null;
  }

  String? validateName(String value) {
    if(value.isEmpty) {
      return "Please enter your name.";
    }
    return null;
  }

}