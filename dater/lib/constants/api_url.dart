class ApiUrl {
  static const apiMainPath = "https://oudeen.com/dater/";
  //authantication api's
  static const loginApi = "${apiMainPath}api/login";
  static const accountActiveApi = "${apiMainPath}api/activate";

  static const getGenderApi = "${apiMainPath}api/get_genders";
  static const getGoalApi = "${apiMainPath}api/get_goals";

  static const getInterestsApi = "${apiMainPath}api/get_interests";
  static const saveInterestsApi = "${apiMainPath}api/set_interest";

  // Country Code List API
  static const getCountryCodeApi = "http://country.io/phone.json";
}
