import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodoma_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
ThemeData _theme = ThemeData.light();
ThemeData get theme=> _theme;



void toggleTheme(int themeValue){
  // themeValue = sharedPreferences.get(AppConstants.THEMEVALUE);


  final isDark = _theme == ThemeData.dark();
  print("themeValue $themeValue");
  if(themeValue == 0) {
    _theme = ThemeData.light();

  }else{
    _theme = ThemeData.dark();

  }

  notifyListeners();
}



}