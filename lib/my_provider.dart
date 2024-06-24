import 'package:flutter/material.dart';
import 'package:news_app/widgets/show_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String selectedLanguage = "en";
  bool isEnglish = true;
  SharedPreferences? preferences;

  void getClickLanguage(value) {
    if (ShowBottomSheet.englishLanguage == value) {
      isEnglish = true;
      selectedLanguage = "en";
      saveLanguage("en");
    } else if (ShowBottomSheet.arabicLanguage == value) {
      isEnglish = false;
      selectedLanguage = "ar";
      saveLanguage("ar");
    }
    notifyListeners();
  }

  Future<void> saveLanguage(String language) async {
    preferences = await SharedPreferences.getInstance();
    preferences!.setString("Language", language);
  }

  Future<void> getLanguage() async {
    preferences = await SharedPreferences.getInstance();
    var lang = preferences!.getString("Language");
    if (lang == "en") {
      isEnglish = true;
      selectedLanguage = lang!;
    }
    else if (lang == "ar") {
      isEnglish = false;
      selectedLanguage = lang!;
    }
  }
}
