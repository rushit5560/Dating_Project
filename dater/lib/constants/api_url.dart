class ApiUrl {
  static const apiMainPath = "https://oudeen.com/dater/";
  //authantication api's
  static const loginApi = "${apiMainPath}api/login";
  static const accountActiveApi = "${apiMainPath}api/activate";
  static const completeSignUpApi = "${apiMainPath}api/complete_signup";
  static const resendCodeApi = "${apiMainPath}api/resend_code";

  static const getGenderApi = "${apiMainPath}api/get_genders";
  static const getGoalApi = "${apiMainPath}api/get_goals";

  static const getInterestsApi = "${apiMainPath}api/get_interests";
  static const saveInterestsApi = "${apiMainPath}api/set_interest";
  static const uploadPhotoApi = "${apiMainPath}api/upload_photo";

  // Country Code List API
  static const getCountryCodeApi = "http://country.io/phone.json";

  //home screen api's
  static const likeProfileApi="${apiMainPath}api/like";
  static const superLoveProfileApi="${apiMainPath}api/like";

  static const matchesApi="${apiMainPath}api/matches";
  static const getLikerApi = "${apiMainPath}api/likers";

  static const getUserDetailsApi = "${apiMainPath}api/get_user_full_details";
  static const getReferralCodeApi = "${apiMainPath}api/get_referral_number";
  static const getCoinsApi = "${apiMainPath}api/get_my_coins";
  static const saveBirthYearApi = "${apiMainPath}api/add_birth_year";
  static const deleteUserAccountApi = "${apiMainPath}api/delete_account";
  static const updateUserLocationApi = "${apiMainPath}api/update_location";
  static const getUserAgeApi = "${apiMainPath}api/get_birth_year";
  static const sendMessageApi = "${apiMainPath}api/messages/send";
  static const getChatListApi = "${apiMainPath}api/messages/open";
  static const getSuggestionApi = "${apiMainPath}api/suggestions";
  static const getLoggedInUserProfileApi = "${apiMainPath}api/get_logged_full_details";
  static const setUserLanguageApi = "${apiMainPath}api/set_language";
  static const deleteUserPhotoApi = "${apiMainPath}api/delete_photo";

}
