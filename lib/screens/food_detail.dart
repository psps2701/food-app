import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/screens/bottom_navigation_bar/main_screen.dart';
import 'package:foodoma_app/screens/rating_screen.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class FoodDetailPage extends StatefulWidget {
  final int themeValue;
  const FoodDetailPage({Key? key, required this.themeValue}) : super(key: key);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {

  void navigateToHomeScreen(){
    Navigator.of(context).pop();

  }

  void navigateToRatingScreen(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RatingScreen()));

  }

  int _value = 0 ;
  int countValue = 0;
  bool addPressed = false;
  bool subPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.themeValue == 1 ? darkThemeBackgroundColor : Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            "assets/dish1.png",
                            fit: BoxFit.fitHeight,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.27,
                          )),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: GestureDetector(
                              onTap: navigateToHomeScreen,
                              child: Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.height * 0.05,
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration:  ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(10))),
                                      color: widget.themeValue == 1 ? darkThemeBackgroundColor:Colors.white),
                                  child:  Icon(
                                    Icons.arrow_back_ios,
                                    size: 15,
                                    color: widget.themeValue == 1 ? darkThemeFontColor:fontColor ,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(child: Container()),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GestureDetector(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                height: MediaQuery.of(context).size.height * 0.05,
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
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8),
                  child: BigText(
                    text: "Ground Beef Tacos",
                    size: 31.sp,
                    color: widget.themeValue == 1 ? darkThemeFontColor: fontColor,

                  ),
                ),
                GestureDetector(
                  onTap: () => navigateToRatingScreen(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/bigstar.png",
                          // width: 50,
                          // height: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        BigText(
                          text: "4.5",
                          size: 14,
                          color: widget.themeValue == 1 ? darkThemeFontColor: fontColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(
                          text: "(25+)",
                          size: 12,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                                // onTap: ()=>navigateToSignIn(),
                                child: SmallText(
                              text: "See Review ",
                              color: orangeColor,
                              size: MediaQuery.of(context).size.height / 52.75,
                            )),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: 2,
                              color: orangeColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BigText(text: "€", color: orangeColor,size: 16.sp,),

                          BigText(
                            text: "9.50",
                            color: widget.themeValue == 1 ? darkThemeFontColor: fontColor,
                            size: MediaQuery.of(context).size.height * 0.034,
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                addPressed = false;
                                subPressed = true;

                                if(countValue != 0) {
                                  countValue--;
                                }
                              });
                            },
                            child: Container(
                              width: 38,
                              height: 38,
                              // padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: orangeColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
                                  color: widget.themeValue == 1 ? subPressed ? Colors.white : darkThemeBackgroundColor : Colors.white),
                              child:  Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 15,
                                  color: widget.themeValue ==1 ?  subPressed ? orangeColor : darkThemeFontColor : orangeColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          BigText(text: countValue.toString(), color: widget.themeValue == 1 ? darkThemeFontColor:fontColor,),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                addPressed = true;
                                subPressed = false;
                                countValue++;
                              });
                            },
                            child: Container(
                              width: 38,
                              height: 38,
                              // padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: orangeColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
                                  color: widget.themeValue == 1 ? addPressed ? darkThemeFontColor:darkThemeBackgroundColor:orangeColor),
                              child:  Center(
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                  color: widget.themeValue == 1 ? addPressed ? orangeColor:Colors.white :fontColor ,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
                  child: SmallText(
                      size: 15.sp,
                      color: textColor,
                      text:
                          "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, cumin, onion powder."),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: BigText(text: "Choice of Add On", size: 18.sp,color: widget.themeValue ==1 ? darkThemeFontColor :fontColor,),
                ),
                //TODO: Addon list Tile
                Padding(
                  padding:  EdgeInsets.only(left: 16.0, top: 10.h),
                  child: Row(
                    children: [
                      Image.asset("assets/addon.png"),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "Pepper  Julienned",
                        color: widget.themeValue ==1 ? darkThemeFontColor: fontColor,
                        size: 14.sp,
                      ),
                      Flexible(child: Container()),

                      // TODO: Radio button
                      Row(
                        children: [
                          SmallText(
                            text: "+\$2.30",
                            size: 14,
                            color: widget.themeValue == 1 ? darkThemeFontColor : fontColor,
                          ),
                          Radio(value: 1, groupValue: _value,
                              activeColor: orangeColor,
                              focusColor: orangeColor,
                              fillColor:
                              MaterialStateColor.resolveWith((states) => widget.themeValue == 1 ? darkThemeFontColor : fontColor),
                              onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });

                              })
                        ],
                      ),
                    ],
                  ),
                ),//TODO: Addon list Tile
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Image.asset("assets/addon.png"),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "Baby Spinach",
                        color: widget.themeValue == 1 ? darkThemeFontColor : fontColor,
                        size: 14.sp,

                      ),
                      Flexible(child: Container()),

                      // TODO: Radio button
                      Row(
                        children: [
                          SmallText(
                            text: "+\$2.30",
                            size: 14,
                            color: widget.themeValue == 1 ? darkThemeFontColor : fontColor,
                          ),
                          Radio(value: 2, groupValue: _value,
                              activeColor: orangeColor,
                              focusColor: orangeColor,

                              onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });

                              })
                        ],
                      ),
                    ],
                  ),
                ),

                Flexible(child: Container()),

                //TODO: Add to cart button
                Center(
                  child: Container(
                    width: 167.w,
                    height: 57.h,
                    decoration:  ShapeDecoration(
                        shadows: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 3,
                              offset: Offset(1, 10))
                        ],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40))),
                        color: orangeColor,),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration:  ShapeDecoration(
                              // shadows: [
                              //   BoxShadow(
                              //       color: Colors.grey.withOpacity(0.2),
                              //       blurRadius: 3,
                              //       offset: Offset(1, 10))
                              // ],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(100))),
                                color: Colors.white),
                            child: Image.asset("assets/cart.png", fit: BoxFit.none,width: 12.w,),

                          ),
                        ),
                        SmallText( text: "ADD TO CART", color:  Colors.white , size: 16,)
                      ],
                    ),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
