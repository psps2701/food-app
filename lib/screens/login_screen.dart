import 'package:flutter/material.dart';
import 'package:foodoma_app/base/custom_snack_bar.dart';
import 'package:foodoma_app/controller/service_controller.dart';
import 'package:foodoma_app/screens/home_screens/home_screen.dart';
import 'package:foodoma_app/screens/bottom_navigation_bar/main_screen.dart';
import 'package:foodoma_app/screens/registration_screens/sign_up_screen.dart';
import 'package:foodoma_app/screens/reset_password_screen.dart';
import 'package:foodoma_app/utils/app_constants.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/app_text_field.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/widgets/text_fields/password_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  late SharedPreferences sharedPreferences;

  bool _isLoading = false;
  var themeValue;

  void navigateToHomeScreen(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainScreen()));

  }
  void navigateToSignUpScreen(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));

  }

  void navigateToResetPassword(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ResetPasswod()));

  }


  Future<void> login() async {
    String email = _emailTextController.text.trim();
    String password = _passwordTextController.text.trim();

    if(email.isEmpty) {
      showCustomsnackBar("Email cannot be empty");

    }else if(password.isEmpty) {
      showCustomsnackBar("Password cannot be empty");

    }else if(!GetUtils.isEmail(email)){
      showCustomsnackBar("Email is not in right format");

    }else{
      setState(() {
        _isLoading = true;
      });
      String response = await ServiceController().login(email: email, password: password);

      if(response == "Success") {
        setState(() {
          _isLoading = false;
        });
        navigateToHomeScreen();
      }else{
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
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          // Positioned(
          //     top: -10,
          //     left: 30,
          //     child: CustomBackButton()),


          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only( right: 20, left: 20),
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CustomBackButton(),

                    ],
                  ),
                  Row(
                    children: [
                      BigText(text: "Login", size: 36.sp,),
                    ],
                  ),//36
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10).r,
                        child: SmallText(text: "E-mail", size: 16.sp, color: loginPageLabelColor,),
                      ),
                    ],
                  ),
                  AppTextField(textController: _emailTextController, hintText: "Your email or phone", textInputType:TextInputType.emailAddress, ),
                  SizedBox(
                    height: 29.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, bottom: 10).r,
                        child: SmallText(text: "Password", size: 16.sp, color: loginPageLabelColor,),
                      ),
                    ],
                  ),
                  AppTextField(textController: _passwordTextController, hintText: "Password", textInputType:TextInputType.emailAddress, isPass: true,isObscure: true, themeValue: themeValue),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(child: GestureDetector(
                      onTap: () => navigateToResetPassword(),
                      child: SmallText(text: "Forgot password?", size: 14.sp, color: orangeColor,))),

                  SizedBox(height: 20.h,),

                    Center(
                      child: GestureDetector(
                        onTap: () => login(),

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
                            child: _isLoading ? Lottie.asset('assets/loader2.json', height: 200):BigText(text: "LOGIN",size: 15.sp, color: Colors.white,)

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
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 10,),
                      SmallText(text: "Don't have an account? ", color: blackColor,size: 14.sp,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: ()=>navigateToSignUpScreen(),
                              child: SmallText(text: "Sign Up ", color: orangeColor,size: 14.sp,)),

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
                        child: SmallText(text: "sign in with", size: 16,),
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
                          height: 57.h,

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
                               Image.asset("assets/fb_logo.png", width: 38.w,),
                               SizedBox(width: 5.w,),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   SmallText(text: "FACEBOOK", size: 13.sp,color: Colors.black,),
                                 ],
                               )
                             ],
                           ),
                        ),
                        Container(
                          width: 147.w,
                          height: 57.h,
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
                               Image.asset("assets/google_logo.png", width: 38.w,),
                               SizedBox(width: 5.w,),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
              SizedBox(height: 10.h,)

            ],
          ),
        ],
      ),
    );
  }
}
