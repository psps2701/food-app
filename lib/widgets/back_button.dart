import 'package:flutter/material.dart';
import 'package:foodoma_app/utils/app_constants.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  late SharedPreferences sharedPreferences;
  var themeValue;

  @override
  void initState() {
    // TODO: implement initState
    sharedPreferences = Get.find<SharedPreferences>();

    themeValue = sharedPreferences.get(AppConstants.THEMEVALUE);
    print(themeValue);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 38,
        height: 38,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration:  ShapeDecoration(
          shadows: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(1, 10),
              color: Colors.grey.withOpacity(0.2),
            )
          ],
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(10))),
            color: Colors.white),
        child:   Icon(Icons.arrow_back_ios, size: 15,color: blackColor),
      ),
    );
  }
}
