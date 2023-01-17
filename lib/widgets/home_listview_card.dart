import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:foodoma_app/widgets/tag_box.dart';

class HomeListViewCard extends StatefulWidget {
  final int themeValue;
  const HomeListViewCard({Key? key, required this.themeValue}) : super(key: key);

  @override
  _HomeListViewCardState createState() => _HomeListViewCardState();
}

class _HomeListViewCardState extends State<HomeListViewCard> {
  @override
  void initState() {
    // TODO: implement initState
    print("int home list view ${widget.themeValue}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 43.w,
      // height: 69.h,
      decoration: BoxDecoration(
          color: widget.themeValue == 1 ? darkThemeContainerColor: Colors.white,

          borderRadius: BorderRadius.circular(10.r)
      ),
      padding: const EdgeInsets.all(10).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0).w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.w,
                        height: 25.h,
                        padding: EdgeInsets.only(right: 16, bottom: 3).r,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: orangeColor

                        ),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: BigText(text: "4.5", color: Colors.white, size: 18.sp,)),
                      ),
                      SizedBox(height: 3.h,),
                      Container(
                        width: 100.w,
                        height: 42.h,
                        padding: EdgeInsets.only(right: 16, bottom: 3).r,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: orangeColor

                        ),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: BigText(text: "5€", color: Colors.white, size: 18.sp,)),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: const Offset(2, 10),
                          color: Colors.grey.withOpacity(0.2),
                        )
                      ],
                      image: DecorationImage(
                          fit: BoxFit.none,
                          image: AssetImage("assets/wendy_logo.png")),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                )

              ],),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BigText(text: "Wendy’s", size: 14.sp,color: widget.themeValue == 1 ? darkThemeFontColor: fontColor,),
                      Icon(Icons.check_circle, color: greyColor,size: 10.h, )

                    ],
                  ),

                  Row(
                    children: [
                      SmallText(text: "0.50", size: 14.sp, color: widget.themeValue == 1 ? dartThemeDeliveryTimeColors :deliveryTimeColors,),
                      SizedBox(width: 2.w,),
                      Image.asset("assets/riderLogo.png", width: 16.w,),
                      SizedBox(width: 7.w,),
                      SmallText(text: "10-15 mins", size: 14.sp, color: widget.themeValue == 1 ? dartThemeDeliveryTimeColors :deliveryTimeColors,),
                      SizedBox(width: 2.w,),
                      Image.asset("assets/stopwatch.png", width: 16.w,),


                    ],
                  ),

                  Row(
                    children: [
                      TagBoxWidget(tagLAbel: "Burger",labelSize: 10, themeValue: widget.themeValue,color: widget.themeValue == 1 ? darkThemeBottomNavigationBarColor: orangeColor,),
                      SizedBox(width: 7.w,),
                      TagBoxWidget(tagLAbel: "FAST FOOD", labelSize: 10, themeValue: widget.themeValue,color: widget.themeValue == 1 ? darkThemeBottomNavigationBarColor: orangeColor),
                    ],
                  ),





                ],
              ),

              GestureDetector(
                onTap: (){
                },
                child: Container(
                  width: 28.w,
                  height: 28.h,
                  // padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration:  BoxDecoration(
                    // shadows: withShadow == true
                    //     ? [
                    //         BoxShadow(
                    //             // color: Colors.grey.withOpacity(0.2),
                    //             blurRadius: 3,
                    //             color: greayColor,
                    //             offset: Offset(1, 10))
                    //       ]
                    //     : [],
                      shape: BoxShape.circle,
                      color: widget.themeValue ==1   ? darkThemeFontColor :orangeColor),
                  child: Icon(
                    Icons.favorite,
                    color: widget.themeValue ==1   ? dartThemeDeliveryTimeColors: Colors.white,
                    size: 15.w,
                  ),
                ),
              ),

            ],
          ),
        ],
      ),

    );
  }
}

