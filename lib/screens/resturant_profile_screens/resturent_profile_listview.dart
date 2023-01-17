import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/resturent_profile_list_card.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class ResturentProfileListView extends StatefulWidget {
  final int themeValue;
  const ResturentProfileListView({Key? key, required this.themeValue}) : super(key: key);

  @override
  _ResturentProfileListViewState createState() => _ResturentProfileListViewState();
}


class _ResturentProfileListViewState extends State<ResturentProfileListView> {
  List<String> dishName = ["Pizze", "Pizza Napolitana", "Margarita"];
  List<String> saladName = ["Ceasar’s Salad", "Chef’s Salad", "Green Salad"];
  @override
  void initState() {
    // TODO: implement initState
    print(widget.themeValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          width:75.w,
          height: 22.h,
          // padding: EdgeInsets.only(right: 16, bottom: 3).r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: orangeColor

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: SmallText(text: "Menu", color: widget.themeValue == 1 ? darkThemeContainerColor: Colors.white, size: 12.sp,)),
              Icon(Icons.arrow_drop_down_circle, color: widget.themeValue == 1 ? darkThemeContainerColor: Colors.white, size: 15,)
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 20.w,
                height: 1.h,
                decoration: BoxDecoration(color: loginPageLabelColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: BigText(text: "Pizza", color: widget.themeValue == 1 ? darkThemeFontColor : fontColor,),
            ),
            Expanded(
              child: Container(
                width: 20.w,
                height: 1.h,
                decoration: BoxDecoration(color: loginPageLabelColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 16.w,
                height: 16.h,
                // padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: ShapeDecoration(
                  // shadows: [
                  //   BoxShadow(
                  //     // color: Colors.grey.withOpacity(0.2),
                  //       blurRadius: 3,
                  //       color: greayColor,
                  //       offset: Offset(1, 10))
                  // ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5).w)),
                    color: orangeColor),
                child: Center(
                    child: SmallText(
                      text: "9",
                      size: 11.sp,
                      color: Colors.white,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 10.w,
                height: 1.h,
                decoration: BoxDecoration(color: loginPageLabelColor),
              ),
            ),


          ],
        ),
        SizedBox(
          height: 200.h,
          width: ScreenUtil().screenWidth,
          child: ListView.builder(
              itemCount: dishName.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: ResturentProfileListCard(name: dishName[index],themeValue: widget.themeValue,),
                );

              }),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 20.w,
                height: 1.h,
                decoration: BoxDecoration(color: loginPageLabelColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: BigText(text: "Salad", color: widget.themeValue == 1 ? darkThemeFontColor: fontColor ,),
            ),
            Expanded(
              child: Container(
                width: 20.w,
                height: 1.h,
                decoration: BoxDecoration(color: loginPageLabelColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 16.w,
                height: 16.h,
                // padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: ShapeDecoration(
                  // shadows: [
                  //   BoxShadow(
                  //     // color: Colors.grey.withOpacity(0.2),
                  //       blurRadius: 3,
                  //       color: greayColor,
                  //       offset: Offset(1, 10))
                  // ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5).w)),
                    color: orangeColor),
                child: Center(
                    child: SmallText(
                      text: "9",
                      size: 11.sp,
                      color: Colors.white,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 10.w,
                height: 1.h,
                decoration: BoxDecoration(color: loginPageLabelColor),
              ),
            ),


          ],
        ),

        SizedBox(
          height: 500.h,
          width: ScreenUtil().screenWidth,
          child: ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
              itemCount: dishName.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: ResturentProfileListCard(name: saladName[index], themeValue:  widget.themeValue,),
                );

              }),
        ),






      ],
    );
  }
}
