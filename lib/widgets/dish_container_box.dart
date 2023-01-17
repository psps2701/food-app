import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class FeatureResturantContainer extends StatefulWidget {
  final int themeValue;
  const FeatureResturantContainer({Key? key, required this.themeValue}) : super(key: key);

  @override
  _FeatureResturantContainerState createState() =>
      _FeatureResturantContainerState();
}

class _FeatureResturantContainerState extends State<FeatureResturantContainer> {

  @override
  void initState() {
    // TODO: implement initState
    print("widget.theme value ${widget.themeValue}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(


      width: 266.w,
      height: 223.h,
      // height: MediaQuery.of(context).size.height * 0.02,
      // padding: EdgeInsets.symmetric(horizontal: 15),
      decoration:  BoxDecoration(

        // boxShadow: [
        //   BoxShadow(
        //     // color: Colors.grey.withOpacity(0.09),
        //       blurRadius: 15.r,
        //       color: greayColor,
        //       offset: Offset(1, 20))
        // ],
        // border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15.r),
        color: widget.themeValue == 1 ? darkThemeContainerColor :Colors.white,
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/42.2),
                    child: Image.asset(
                      fit:BoxFit.cover,
                      height: 136.h,
                      "assets/dish1.png",
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.22,
                        // height: MediaQuery.of(context).size.height * 0.04,
                        // padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration:  ShapeDecoration(
                            // shadows: withShadow == true ? [
                            //   BoxShadow(
                            //     // color: Colors.grey.withOpacity(0.2),
                            //       blurRadius: 3,
                            //       color: greayColor,
                            //       offset: Offset(1, 10))
                            // ]: [],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(MediaQuery.of(context).size.height/42.2))),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                text: "4.5",
                                size: MediaQuery.of(context).size.height * 0.0177,
                              ),
                              Image.asset(
                                "assets/star.png",
                                width: 15,
                                height: 15,
                              ),
                              SmallText(
                                text: "(25+)",
                                size: MediaQuery.of(context).size.height * 0.0144,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Expanded(
                    //     child: Container()),
                    // SizedBox(width: MediaQuery.of(context).size.width  * 0.25,),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        child: Container(
                          width: 28.w,
                          height: 28.h,
                          // padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: const ShapeDecoration(
                              // shadows: withShadow == true
                              //     ? [
                              //         BoxShadow(
                              //             // color: Colors.grey.withOpacity(0.2),
                              //             blurRadius: 3,
                              //             color: greayColor,
                              //             offset: Offset(1, 10))
                              //       ]
                              //     : [],
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              color: orangeColor),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 20.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            // width: double.infinity,
            // height: 200,
            color: widget.themeValue == 1 ? darkThemeContainerColor :Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                  child: Row(
                    children: [
                      BigText(
                        text: "McDonald’s",
                        size: MediaQuery.of(context).size.height * 0.0177,
                        color: widget.themeValue == 1 ? darkThemeFontColor: fontColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Image.asset(
                          "assets/clock.png",
                          width: 15,
                          height: 15,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/rider.png"),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SmallText(
                          text: "Free delivery",
                          size: MediaQuery.of(context).size.height * 0.0144,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.07,
                      ),
                      Image.asset("assets/stopwatch.png"),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SmallText(
                          text: "10-15 mins",
                          size: MediaQuery.of(context).size.height * 0.0144,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                          // width: MediaQuery.of(context).size.width * 0.15,
                          // height: MediaQuery.of(context).size.height * 0.036,
                          // padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: ShapeDecoration(
                            // shadows: withShadow == true ? [
                            //   BoxShadow(
                            //     // color: Colors.grey.withOpacity(0.2),
                            //       blurRadius: 3,
                            //       color: greayColor,
                            //       offset: Offset(1, 10))
                            // ]: [],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SmallText(
                                text: "Burger",
                                color: widget.themeValue == 1 ? darkThemeFontColor:loginPageLabelColor,
                              ),
                            ),
                          )),
                      SizedBox(width: 5.w),
                      Container(
                          // width: MediaQuery.of(context).size.width * 0.15,
                          // height: MediaQuery.of(context).size.height * 0.036,
                          // padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: ShapeDecoration(
                            // shadows: withShadow == true ? [
                            //   BoxShadow(
                            //     // color: Colors.grey.withOpacity(0.2),
                            //       blurRadius: 3,
                            //       color: greayColor,
                            //       offset: Offset(1, 10))
                            // ]: [],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SmallText(
                                text: "Fast Food",
                                color: widget.themeValue == 1 ? darkThemeFontColor:loginPageLabelColor,
                              ),
                            ),
                          )),
                      SizedBox(width: 5.w),
                      Container(
                          // width: MediaQuery.of(context).size.width * 0.15,
                          // height: MediaQuery.of(context).size.height * 0.036,
                          // padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: ShapeDecoration(
                            // shadows: withShadow == true ? [
                            //   BoxShadow(
                            //     // color: Colors.grey.withOpacity(0.2),
                            //       blurRadius: 3,
                            //       color: greayColor,
                            //       offset: Offset(1, 10))
                            // ]: [],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SmallText(
                                text: "Chicken",
                                color: widget.themeValue == 1 ? darkThemeFontColor:loginPageLabelColor,
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
