bool isAlphabet(String input) {
  final alphabetsRegex = RegExp(r'^[a-zA-Z]+$');
  return alphabetsRegex.hasMatch(input);
}


bool isValidAge(String input) {
  final ageRegex = RegExp(r'^[1-9][0-9]{0,2}$');
  return ageRegex.hasMatch(input);
}


bool isValidPhoneNumber(String input) {
  final phoneNumberRegex = RegExp(r'^(?:\+91|0)?[0-9]{5}\s?[0-9]{5}$');
  return phoneNumberRegex.hasMatch(input);
}


bool isValidPassword(String input) {
  return input.length > 7 ? true : false;
}


bool isValidEmail(String input) {
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
  return emailRegex.hasMatch(input);
}


bool isValidName(String input) {
  final nameRegex = RegExp(r'^[a-zA-Z]+(\s[a-zA-Z]+)?$');
  return nameRegex.hasMatch(input);
}


bool isValidWebsite(String input) {
  final urlRegex = RegExp(
      r'^(?:www\.)?[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+(?:\/[^\s]*)?$');
  return urlRegex.hasMatch(input);
}
