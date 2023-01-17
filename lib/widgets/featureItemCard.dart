import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class FeatureItemCard extends StatefulWidget {
 final String name;
 final String details;
 final String rating;
 final String reviewsCount;
 final String imageUrl;
 final String price;
 final int themeValue;
  const FeatureItemCard({Key? key, required this.name, required this.details, required this.rating, required this.reviewsCount, required this.imageUrl, required this.price, required this.themeValue}) : super(key: key);

  @override
  _FeatureItemCardState createState() => _FeatureItemCardState();
}

class _FeatureItemCardState extends State<FeatureItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      // height: 100.h,

      decoration:  ShapeDecoration(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        color: widget.themeValue == 1 ? darkThemeContainerColor :Colors.white,
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20.0.r),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.fill,
                    width: ScreenUtil().screenWidth,
                    height: 150.h,
                  )),
              Row(

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.2,
                      // height: MediaQuery.of(context).size.height * 0.05,
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
                              BorderRadius.all(Radius.circular(20.r))),
                          color: Colors.white),
                      child: Padding(
                        padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BigText(
                              text: "\$",
                              size: 18.sp,
                              color: orangeColor,
                            ),
                            SmallText(
                              text: widget.price,
                              size: 18.sp,
                              color: blackColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(child: Container()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        width: 38.w,
                        height: 38.h,
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
                          size: 22.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top:130.h,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // width: MediaQuery.of(context).size.width * 0.2,
                    // height: MediaQuery.of(context).size.height * 0.05,
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
                            BorderRadius.all(Radius.circular(20.r))),
                        color: widget.themeValue == 1 ? darkThemeContainerColor : Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BigText(
                            text: widget.rating,
                            size: 12.sp,
                            color: widget.themeValue == 1 ? darkThemeFontColor: fontColor,
                          ),
                          Image.asset(
                            "assets/star.png",
                            width: 15.w,
                            height: MediaQuery.of(context).size.height * 0.0177,
                          ),
                          SmallText(
                            text: "(${widget.reviewsCount}+)",
                            size: 8.5.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),


            ],
          ),
          SizedBox(height: 15.h,),
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
                color: widget.themeValue == 1 ? darkThemeContainerColor:Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(MediaQuery.of(context).size.height / 42.2)))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0).w,
                  child: Row(
                    children: [
                      BigText(
                        text: widget.name,
                        size: 15.sp,
                        color: widget.themeValue == 1 ? darkThemeFontColor:fontColor ,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 5.0),
                      //   child: Image.asset(
                      //     widget.imageUrl,
                      //     width: 15,
                      //     height: 15,
                      //   ),
                      // )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: SmallText(text: widget.details,size: 12.sp,)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
