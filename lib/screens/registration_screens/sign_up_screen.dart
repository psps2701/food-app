import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/base/custom_snack_bar.dart';
import 'package:foodoma_app/controller/service_controller.dart';
import 'package:foodoma_app/screens/bottom_navigation_bar/main_screen.dart';
import 'package:foodoma_app/screens/registration_screens/enter_mobile_number_screen.dart';
import 'package:foodoma_app/screens/registration_screens/verification_screen.dart';
import 'package:foodoma_app/utils/app_constants.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/app_text_field.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _fullNameTextController = TextEditingController();
  late SharedPreferences sharedPreferences;
  var themeValue;
  bool _isLoading  = false;
  var latitude;
  var longitude;

  void navigateToHomeScreen(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainScreen()));

  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position =  await Geolocator.getCurrentPosition();
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }



  Future<void> register() async {
    String email = _emailTextController.text.trim();
    String password = _passwordTextController.text.trim();
    String fullName = _fullNameTextController.text.trim();

    if(email.isEmpty) {
      showCustomsnackBar("Email cannot be empty");

    }else if(fullName.isEmpty) {
      showCustomsnackBar("Full name cannot be empty");

    }else if(password.isEmpty) {
      showCustomsnackBar("Password cannot be empty");

    }else if(!GetUtils.isEmail(email)){
      showCustomsnackBar("Email is not in right format");

    }else{
      setState(() {
        _isLoading = true;
      });

      Get.to(() => MobileNumberVerificationScreen(name: fullName, email: email, password: password, lat: latitude.toString(), long: longitude.toString(),));
      setState(() {
        _isLoading = false;
      });
      // String response = await ServiceController().register(fullName: fullName, email: email, password: password);
      //
      // if(response == "Success") {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   navigateToHomeScreen();
      // }else{
      //
      // }

    }

  }

  @override
  void initState() {
    // TODO: implement initState
    sharedPreferences = Get.find<SharedPreferences>();
    themeValue =  sharedPreferences.getInt(AppConstants.THEMEVALUE) ?? 0;
    var location = _determinePosition();
    print(location);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeValue == 0  ? Colors.white: darkThemeBackgroundColor,
      body: Stack(
        // fit: StackFit.passthrough,
        children: [
          // Positioned(
          //   top: 10,
          //   left: 0,
          //   child: Align(
          //     alignment: Alignment.topLeft,
          //     child: SizedBox(
          //         width: 40.w,
          //         child: Image.asset("assets/top_left.png")),
          //   ),
          // ),
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
          // Padding(
          //   padding: EdgeInsets.only(left: 20).r,
          //   child: CustomBackButton(),
          // ),

          ListView(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.12),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Row(
                      children: [
                        BigText(text: "Sign Up", size: 36.sp,color: themeValue ==  0 ? fontColor : darkThemeFontColor,),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10).r,
                          child: SmallText(text: "Full name", size: 16.sp, color: themeValue == 0 ? loginPageLabelColor: darkThemeLabelColor,),
                        ),
                      ],
                    ),
                    AppTextField(textController: _fullNameTextController, hintText: "Your Full name", textInputType:TextInputType.emailAddress, themeValue: themeValue,),
//36
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10).r,
                          child: SmallText(text: "E-mail", size: 16.sp, color: themeValue == 0 ? loginPageLabelColor: darkThemeLabelColor,),
                        ),
                      ],
                    ),
                    AppTextField(textController: _emailTextController, hintText: "Your email or phone", textInputType:TextInputType.emailAddress, themeValue: themeValue, ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only( bottom: 10).r,
                          child: SmallText(text: "Password", size: 16.sp, color: themeValue == 0 ? loginPageLabelColor: darkThemeLabelColor,),
                        ),
                      ],
                    ),
                    AppTextField(textController: _passwordTextController, hintText: "Password", textInputType:TextInputType.emailAddress, isPass: true,isObscure: true, themeValue: themeValue),
                    SizedBox(
                      height: 20.h,
                    ),

                    SizedBox(height: 20.h,),

                    Center(
                      child: GestureDetector(
                        onTap: () => register(),

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
                            child: _isLoading ? Lottie.asset('assets/loader2.json', height: 200):BigText(text: "SIGN UP",size: 15.sp, color: Colors.white,)

                          // Text(
                          //   'LOGIN',
                          //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SmallText(text: "Already have an account?", color: themeValue == 0 ? loginPageLabelColor: darkThemeLabelColor,size: MediaQuery.of(context).size.height/52.75,),
                        SizedBox(width: 5,),
                        Column(
                          children: [
                            GestureDetector(
                              // onTap: ()=>navigateToSignUpScreen(),
                                child: SmallText(text: "Login", color: orangeColor,size: MediaQuery.of(context).size.height/52.75,)),

                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 60.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: 102.w,
                            height: 2,
                            color: loginScreenLineColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: SmallText(text: "sign up with", size: 16,),
                        ),
                        Expanded(
                          child: Container(
                            width: 102.w,
                            height: 2,
                            color: loginScreenLineColor,
                          ),
                        ),

                      ],
                    ),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 147.w,

                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(100.r)),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    offset: const Offset(1, 10),
                                    color: Colors.grey.withOpacity(0.1),
                                  )
                                ]
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/fb_logo.png", width: 39.w,),
                                SizedBox(width: 5.w,),
                                Column(
                                  children: [
                                    SmallText(text: "FACEBOOK", size: 13.sp,color: Colors.black,),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 147.w,
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(100.r)),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    offset: const Offset(1, 10),
                                    color: Colors.grey.withOpacity(0.1),
                                  )
                                ]
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/google_logo.png", width: 36.w,),
                                SizedBox(width: 5.w,),
                                Column(
                                  children: [
                                    SmallText(text: "GOOGLE", size: 13.sp,color: Colors.black,),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // SizedBox(width: 10,),


                        ],
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              )

            ],
          ),


        ],
      ),



    );
  }
}
