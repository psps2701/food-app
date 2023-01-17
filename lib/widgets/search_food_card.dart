import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class SearchFoodCard extends StatefulWidget {
  final String name;
  final String details;
  final String rating;
  final String reviewsCount;
  final String imageUrl;
  final String price;

  const SearchFoodCard( {Key? key, required this.name, required this.details, required this.rating, required this.reviewsCount, required this.imageUrl, required this.price,}) : super(key: key);

  @override
  _SearchFoodCardState createState() => _SearchFoodCardState();
}

class _SearchFoodCardState extends State<SearchFoodCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -90,
          // top: 120,
          left: 0,
          right: 0,
          child: Container(
            // width: double.infinity,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(MediaQuery.of(context).size.height / 42.2)))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(top: 35,left: 8.0),
                  child: Row(
                    children: [
                      BigText(
                        text: widget.name,
                        size: 16.sp,
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
          ),
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.fill,
              // width: 154.w,
              height: double.infinity,
            )),
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          child: SizedBox(
            child: Row(

              children: [
                Container(
                  // width: MediaQuery.of(context).size.width * 0.2,
                  // height: MediaQuery.of(context).size.height * 0.05,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BigText(
                        text: "\$",
                        size: 16.sp,
                        color: orangeColor,
                      ),
                      SmallText(
                        text: widget.price,
                        size: 16.sp,
                        color: blackColor,
                      )
                    ],
                  ),
                ),
                Flexible(child: Container()),
                GestureDetector(
                  child: Container(
                    width: 40.w,
                    height: 38.h,
                    // padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration:  ShapeDecoration(
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
                            BorderRadius.all(Radius.circular(100.r))),
                        color: orangeColor),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 22.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -10.h,
          left: 10.w,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.23,
              height: MediaQuery.of(context).size.height * 0.05,
              // padding: EdgeInsets.symmetric(horizontal: 15),
              decoration:  ShapeDecoration(
                shadows: [
                  BoxShadow(
                    // color: Colors.grey.withOpacity(0.2),
                      blurRadius: 3,
                      color: greayColor,
                      offset: Offset(1, 10))
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
                      size: MediaQuery.of(context).devicePixelRatio * 5,
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
    );
  }
}
