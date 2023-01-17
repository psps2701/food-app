import 'package:flutter/material.dart';
import 'package:foodoma_app/screens/drawer.dart';
import 'package:foodoma_app/screens/home_screens/home_screen.dart';
import 'package:foodoma_app/utils/app_constants.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences sharedPreferences;

  var themeValue;

  @override
  void initState() {
    // TODO: implement initState
    sharedPreferences = Get.find<SharedPreferences>();
    themeValue = sharedPreferences.get(AppConstants.THEMEVALUE);
    print("in home page ${themeValue}");

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeValue == 1 ? darkThemeBackgroundColor: Colors.white,
      body: Stack(
        children: [
          DrawerScreen(themeValue: themeValue != null ? themeValue:0,),
          HomeScreen(),
        ],
      ),
    );
  }
}
