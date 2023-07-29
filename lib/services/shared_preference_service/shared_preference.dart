import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  static void setHasOnBoardingPage(bool hasOnBoardingPage) async {
    await sharedPreferences!.setBool('hasOnBoardingPage', hasOnBoardingPage);
  }

  static bool hasOnBoardingPage() {
    return sharedPreferences!.getBool('hasOnBoardingPage') ?? true;
  }

}
