import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodoma_app/screens/login_screen.dart';
import 'package:foodoma_app/screens/oboarding_screen/on_boarding_screen.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void navigateToSignIn() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void navigateToOnboardingScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: Image.asset(
            "assets/start_background.png",
            fit: BoxFit.cover,
            width: ScreenUtil().screenWidth,
          )),

          Positioned(
              right: 28,
              top: 34,
              child: Image.asset("assets/skip_btn.png", height: 32.h,)),
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60.h,),
                  Image.asset("assets/start_screen_logo.png"),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Container(
                    // margin: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 84.w,
                          height: 2.h,
                          color: transparentWhiteColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0).w,
                          child: SmallText(
                            text: "sign in with",
                            size: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 84.w,
                          height: 2.h,
                          color: transparentWhiteColor,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Container(
                        width: 139.w,
                        height: 44.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: ShapeDecoration(
                            image: DecorationImage(image: AssetImage("assets/facebook_button.png")),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(35.r))),
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 139.w,
                        height: 44.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: ShapeDecoration(
                            image: DecorationImage(image: AssetImage("assets/google_button.png")),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(35.r))),
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => navigateToOnboardingScreen(),
                      child: Container(
                        width: 293.w,
                        height: 54.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30.r)),
                            border: Border.all(
                              color: Colors.white,
                            ),
                            color: whiteColorWithExtraTranspernt),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0.w),
                          child: SmallText(
                            text: "Start with email or phone",
                            color: Colors.white,
                            size: 17.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text:  TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            print('Tapped on hyperlink');
                            navigateToSignIn();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
