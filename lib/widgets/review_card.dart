import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({Key? key}) : super(key: key);

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0).r,
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 25.r,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1504131598085-4cca8500b677?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGdpcmxzfGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: -20,
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 90.2,
                          right: MediaQuery.of(context).size.height / 90.2),
                      decoration: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(5.r),
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
              Padding(
                padding: const EdgeInsets.only(left: 20.0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: "Alyce Lambo",
                      size: 15.sp,
                      color: Colors.black,
                    ),
                    SmallText(
                      text: "25/06/2020",
                      size: 13.sp,
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).r,
            child: SmallText(
              color: reviewTextColor,
              fontWeight: FontWeight.normal,
              size: 15.sp,
                text:
                    "Really convenient and the points system helps benefit loyalty. Some mild glitches here and there, but nothing too egregious. Obviously needs to roll out to more remote."),
          )
        ],
      ),
    );
  }
}
