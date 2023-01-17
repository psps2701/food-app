import 'package:flutter/material.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreenFoodContainer extends StatefulWidget {
  String name;
  String details;
  String rating;
  String reviewsCount;
  String imageUrl;
  String price;
   CategoryScreenFoodContainer({Key? key, required this.name, required this.details, required this.rating, required this.imageUrl, required this.price, required this.reviewsCount}) : super(key: key);

  @override
  _CategoryScreenFoodContainerState createState() =>
      _CategoryScreenFoodContainerState();
}

class _CategoryScreenFoodContainerState
    extends State<CategoryScreenFoodContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      height: 320.h,

      decoration:  ShapeDecoration(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        color: Colors.white,
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
                    height: 239.h,
                  )),
              Padding(
                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.2),
                child: Row(

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
              ),
              Positioned(
                top:215.h,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // width: MediaQuery.of(context).size.width * 0.2,
                    // height: MediaQuery.of(context).size.height * 0.05,
                    // padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration:  ShapeDecoration(
                      shadows: [
                        BoxShadow(
                          // color: Colors.grey.withOpacity(0.9),
                        color: greayColor,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75))
                      ],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.r))),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BigText(
                            text: widget.rating,
                            size: 12.sp,
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
          SizedBox(height: 5.h,),
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(MediaQuery.of(context).size.height / 42.2)))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 8.0),
                  child: Row(
                    children: [
                      BigText(
                        text: widget.name,
                        size: 18.sp,
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
                  child: SmallText(text: widget.details,size: 14.sp,)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
