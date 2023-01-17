import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/screens/resturant_profile_screens/resturent_profile_gridview.dart';
import 'package:foodoma_app/screens/resturant_profile_screens/resturent_profile_listview.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/conatiner_with_image.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:foodoma_app/widgets/tag_box.dart';

class ResturantProfileScreen extends StatefulWidget {
  final int themeValue;
  const ResturantProfileScreen({Key? key, required this.themeValue}) : super(key: key);

  @override
  _ResturantProfileScreenState createState() => _ResturantProfileScreenState();
}

class _ResturantProfileScreenState extends State<ResturantProfileScreen> {
  List<String> tagBoxLabel = ["PIZZA", "Chicken", "Fast Food"];
  bool listPressed = false;
  bool gridPressed = true;

  void navigateBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.themeValue == 1 ? darkThemeBackgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: ScreenUtil().screenHeight * 0.45,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0.r),
                        child: Image.asset(
                          "assets/banner.png",
                        )),
                  ),
                  // back button
                  Positioned(
                    // top: 0,
                    left: 15,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () => navigateBack(),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.05,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration:  ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                color: widget.themeValue == 1 ? darkThemeBackgroundColor :Colors.white),
                            child:  Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                              color: widget.themeValue == 1 ? Colors.white : fontColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    // bottom: 0,
                    top: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    listPressed = false;
                                    gridPressed = true;
                                  });
// return navigateToCategoryPage();
                                },
                                child: ImageContainer(
                                  imageName: "assets/grid_option.png",
                                  width: 51.w,
                                  height: 51.h,
                                  isPressed: gridPressed, themeValue: 0,
                                )),
                            SizedBox(
                              width: 150.w,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    listPressed = true;
                                    gridPressed = false;
                                  });

                                },
                                child: ImageContainer(
                                  imageName: "assets/list_option.png",
                                  width: 51.w,
                                  height: 51.h,
                                  isPressed: listPressed, themeValue: 0,
                                )),
                          ],
                        ),
                        Center(child: BigText(text: "Pizza Hut", color: widget.themeValue == 1 ?darkThemeFontColor :fontColor,)),
                        SmallText(
                          text: "4102  Pretty View Lanenda",
                          size: 13,
                          color: loginPageLabelColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            height: 34.h,
                            // width: ScreenUtil().screenWidth,
                            child: Align(
                              alignment: Alignment.center,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: tagBoxLabel.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: TagBoxWidget(
                                          tagLAbel: tagBoxLabel[index],
                                          color: greayColor,
                                          textColor: blackColor,
                                          labelSize: 12.sp.toInt(), themeValue: widget.themeValue,
                                        ));
                                  }),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset("assets/rider.png"),
                            SizedBox(
                              width: 5,
                            ),
                            SmallText(
                              text: "Free delivery",
                              size: 14.sp,
                              color: loginPageLabelColor,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset("assets/stopwatch.png"),
                            SizedBox(
                              width: 5,
                            ),
                            SmallText(
                              text: "10-15 mins",
                              size: 14.sp,
                              color: loginPageLabelColor,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/resurent_profile_star.png",
                              width: 20,
                              height: 20,
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            BigText(
                              text: "4.5",
                              size: MediaQuery.of(context).size.height * 0.0177,
                              color: widget.themeValue == 1 ? darkThemeFontColor:fontColor ,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "(25+)",
                              size: MediaQuery.of(context).size.height * 0.0144,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            gridPressed ? ResturentProfileGridView(themeValue: widget.themeValue,) : ResturentProfileListView(themeValue: widget.themeValue,)
          ],
        ),
      ),
    );
  }
}
