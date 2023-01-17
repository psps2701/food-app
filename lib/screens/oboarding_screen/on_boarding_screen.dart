import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/screens/bottom_navigation_bar/main_screen.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = new PageController();
  bool isLastPage = false;

  void navigateToHomeScreen(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == 2;
                    });
                  },
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/onboarding_logo1.png", height: 345.h,),
                        Center(
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: 3,
                            effect: WormEffect(
                                activeDotColor: orangeColor,
                                dotColor: loginPageLabelColor,
                                dotHeight: 4,
                                dotWidth: 8,
                                spacing: 4),
                            onDotClicked: (index) => _pageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInCubic),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            SizedBox(width: 10.w,),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                              child: SmallText(text: "Browse our menu and order directly", size: 30.sp,color: blackColor,)),
                          ],
                        ),//36


                      ],
                    ),
                    Column(
                      children: [
                        Image.asset("assets/onboarding_pic2.png", height: 345.h,),
                        Center(
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: 3,
                            effect: WormEffect(
                                activeDotColor: orangeColor,
                                dotColor: loginPageLabelColor,
                                dotHeight: 4,
                                dotWidth: 8,
                                spacing: 4),
                            onDotClicked: (index) => _pageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInCubic),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            SizedBox(width: 10.w,),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: SmallText(text: "Even to space with us! Together", size: 30.sp,color: blackColor,)),
                          ],
                        ),//36


                      ],
                    ),

                    Column(
                      children: [
                        Image.asset("assets/on_boarding_logo3.png", height: 345.h,),
                        Center(
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: 3,
                            effect: WormEffect(
                                activeDotColor: orangeColor,
                                dotColor: loginPageLabelColor,
                                dotHeight: 4,
                                dotWidth: 8,
                                spacing: 4),
                            onDotClicked: (index) => _pageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInCubic),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            SizedBox(width: 10.w,),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: SmallText(text: "Pickup or Delivery at your door", size: 30.sp,color: blackColor,)),
                          ],
                        ),//36


                      ],
                    ),

                  ],
                ),
              ),
            ),
            // Center(
            //   child: SmoothPageIndicator(
            //     controller: _pageController,
            //     count: 3,
            //     effect: WormEffect(
            //         activeDotColor: orangeColor,
            //         dotColor: loginPageLabelColor,
            //         dotHeight: 10,
            //         dotWidth: 10,
            //         spacing: 5),
            //     onDotClicked: (index) => _pageController.animateToPage(
            //         index,
            //         duration: Duration(milliseconds: 500),
            //         curve: Curves.easeInCubic),
            //   ),
            // )
            GestureDetector(
                onTap: (){
                 isLastPage ?  navigateToHomeScreen() : _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                },
                child: Image.asset("assets/move_next.png", height: 67.h,))

          ],
        ),
      ),
    );
  }
}
