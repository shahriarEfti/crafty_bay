import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? accessToken;
  final String _accessTokenKey = 'access-token';
  final String _isProfileCompleteKey = 'is-profile-complete';


  Future<void> saveAccessToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    accessToken = token;
  }


  Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString(_accessTokenKey);
    accessToken = token;
    return token;
  }


  bool isLoggedInUser() {
    return accessToken != null;
  }

  // Check if the user's profile is complete
  Future<bool> isProfileComplete() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_isProfileCompleteKey) ?? false;
  }

  // Save the profile completion status
  Future<void> saveProfileCompletion(bool isComplete) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(_isProfileCompleteKey, isComplete);
  }


  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
