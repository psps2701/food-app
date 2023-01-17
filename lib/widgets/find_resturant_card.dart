import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:foodoma_app/widgets/tag_box.dart';

class FindResurentCard extends StatefulWidget {
  const FindResurentCard({Key? key}) : super(key: key);

  @override
  _FindResurentCardState createState() => _FindResurentCardState();
}

class _FindResurentCardState extends State<FindResurentCard> {

  List<String> tagBoxLabel = ["PIZZA", "Chicken", "Fast Food"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8).w,
      decoration: BoxDecoration(
        border: Border.all(color: greayColor),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          const BoxShadow(
            color: greayColor,
          ),
          const BoxShadow(
            color: Colors.white,
            spreadRadius: -3,
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: const Offset(1, 10),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Image.network(
                          fit: BoxFit.cover,
                          "https://1000logos.net/wp-content/uploads/2017/05/Pizza-Hut-Logo-1999-1024x576.jpg", width: 50.w, height: 50.h,),
                      ),
                    ),
                    Positioned(
                      top: -10,
                      right: -20,
                      child: Container(
                        width: 18.w,
                        height: 18.h,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 90.2,
                            right: MediaQuery.of(context).size.height / 90.2),
                        decoration: BoxDecoration(
                          color: yellowColor,
                          borderRadius: BorderRadius.circular(6.r),
                          // boxShadow: [
                          //   BoxShadow(
                          //     blurRadius: 3,
                          //     spreadRadius: 1,
                          //     offset: const Offset(1, 10),
                          //     color: Colors.grey.withOpacity(0.2),
                          //   )
                          // ]
                        ),
                        child: Center(
                            child: SmallText(
                              text: "5.0",
                              color: Colors.white,
                            )),
                      ),
                    )

                  ],
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: GestureDetector(
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    // padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                      color: orangeColor,
                      shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ),
                ),
              ),

            ],
          ),

          Row(
            children: [
              BigText(text: "Starbuck ", size: 15.sp,),
              Icon(Icons.check_circle, color: greyColor,size: 10,)
            ],
          ),
          Row(
            children: [
              Image.asset("assets/rider.png"),
              SizedBox(
                width: 5,
              ),
              SmallText(
                text: "Free",
                size: 12.sp,
                color: loginPageLabelColor,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset("assets/stopwatch.png"),
              SizedBox(
                width: 5,
              ),
              SmallText(
                text: "10-15 mins",
                size: 12.sp,
                color: loginPageLabelColor,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: 22.h,
              width: ScreenUtil().screenWidth,
              child: Align(
                alignment: Alignment.center,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: TagBoxWidget(
                          tagLAbel: tagBoxLabel[index],
                          color: greayColor,
                          textColor: blackColor, themeValue: 0,
                        ),
                      );
                    }),
              ),
            ),
          ),



        ],
      ),

    );
  }
}
