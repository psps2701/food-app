import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/controller/service_controller.dart';
import 'package:foodoma_app/screens/registration_screens/verification_screen.dart';
import 'package:foodoma_app/utils/app_constants.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/utils/custom_snack_bar.dart';
import 'package:foodoma_app/widgets/app_text_field.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobileNumberVerificationScreen extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  final String lat;
  final String long;
  const MobileNumberVerificationScreen({Key? key, required this.name, required this.email, required this.password, required this.lat, required this.long}) : super(key: key);

  @override
  State<MobileNumberVerificationScreen> createState() => _MobileNumberVerificationScreenState();
}

class _MobileNumberVerificationScreenState extends State<MobileNumberVerificationScreen> {
  bool _isLoading = false;
  var themeValue;
  late SharedPreferences sharedPreferences;
  String selectedCountry = "";
  final TextEditingController _numberTextFieldController = TextEditingController();
  String number = "";
  String dailCode = "";


  Future<void> MoveToEnterPinScreen() async{
    number = dailCode == "" ? "+1" : dailCode + _numberTextFieldController.text.trim();
    
    if(number.isEmpty) {
      showCustomsnackBar("Please enter your number");
    }else {
      setState(() {
        _isLoading = true;
      });
     String response = await ServiceController().sendOTPVerification(email: widget.email, phoneNumber: number);

     if(response == "Success") {
       setState(() {
         _isLoading = false;
       });
       Get.to(() => VerificationScreen(name: widget.name, email: widget.email, password: widget.password, lat: widget.lat, long: widget.long, phone: number,));

     }else {
       setState(() {
         _isLoading = false;
       });

     }


    }
  }




  @override
  void initState() {
    // TODO: implement initState
    sharedPreferences = Get.find<SharedPreferences>();
    themeValue =  sharedPreferences.getInt(AppConstants.THEMEVALUE) ?? 0;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeValue == 0  ? Colors.white: darkThemeBackgroundColor,
      body: Stack(
        children: [
          // ,
          Positioned(
            left: 0,
            top: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                  width: 150.w,

                  child: Image.asset("assets/top_left.png")),
            ),
          ),
          Positioned(
            top: 0.h,
            right: 0.w,
            child: SizedBox(
                width: 100,
                child: Image.asset("assets/top_right.png")),
          ),
          Positioned(
              top: -10,
              left: 30,
              child: CustomBackButton()),

          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 20.w, right: 20.w),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: MediaQuery.of(context).size.height * 0.18,),
                  Row(
                    children: [
                      BigText(text: "Registration", size: 36.sp,color: themeValue ==  0 ? fontColor : darkThemeFontColor,),
                    ],
                  ),
                  SizedBox(height: 2.h,),

                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: SmallText(text: "Enter your phone number to verify your account ", size: 14.sp,color: themeValue ==  0 ? loginPageLabelColor : darkThemeFontColor,fontWeight: FontWeight.w500,)),
                    ],
                  ),

                  SizedBox(height: 28.h,),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: orangeColor)
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: CountryListPick(
                              appBar: AppBar(
                                backgroundColor: orangeColor,
                                title: Text('Country code'),
                              ),

                              // if you need custome picker use this
                              // pickerBuilder: (context, CountryCode countryCode){
                              //   return Row(
                              //     children: [
                              //       Image.asset(
                              //         countryCode.flagUri,
                              //         package: 'country_list_pick',
                              //       ),
                              //       Text(countryCode.code),
                              //       Text(countryCode.dialCode),
                              //     ],
                              //   );
                              // },

                              // To disable option set to false
                              theme: CountryTheme(
                                isShowFlag: true,
                                isShowTitle: false,
                                isShowCode: false,
                                isDownIcon: true,
                                showEnglishName: true,
                              ),
                              // Set default value

                              initialSelection: 'US',
                              onChanged: (CountryCode? code) {
                                print(code!.name);
                                print(code.code);
                                print(code.dialCode);
                                print(code.flagUri);

                                setState(() {
                                  dailCode = code.dialCode!;
                                });
                              },
                              // Whether to allow the widget to set a custom UI overlay
                              useUiOverlay: true,
                              // Whether the country list should be wrapped in a SafeArea
                              useSafeArea: false
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _numberTextFieldController,
                            decoration: InputDecoration(
                              hintText: "Enter your number",
                              border: InputBorder.none
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: 51.h,),

                  GestureDetector(
                      onTap: () {
                        MoveToEnterPinScreen();
                      },
                    child: Container(
                        width: 248.w,
                        height: 60.h,
                        // height: MediaQuery.of(context).size.height * 0.06,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration:  BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 1,
                                offset: const Offset(1, 10),
                                color: shadowOrangeColor,
                              )
                            ],
                            borderRadius: BorderRadius.circular(100.r),
                            color: orangeColor),
                        child: _isLoading ? Lottie.asset('assets/loader2.json', height: 200):BigText(text: "SEND",size: 15.sp, color: Colors.white,)

                      // Text(
                      //   'LOGIN',
                      //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                      // ),
                    ),
                  ),
                  Expanded(child: Container()),

                  Image.asset("assets/f_logo.png", height: 40.h, width: 40.w,)

                ],
              ),
            ),
          )

        ],
      ),
      
    );
  }
}
