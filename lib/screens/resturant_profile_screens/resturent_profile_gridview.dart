import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/app_constants.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/featureItemCard.dart';
import 'package:foodoma_app/widgets/popular_item_card.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResturentProfileGridView extends StatefulWidget {
  final int themeValue;
  const ResturentProfileGridView({Key? key, required this.themeValue}) : super(key: key);

  @override
  _ResturentProfileGridViewState createState() =>
      _ResturentProfileGridViewState();
}

class _ResturentProfileGridViewState extends State<ResturentProfileGridView> {

  List<String> name = ["Chicken Hawaiian", "Chicken", "Biryani", "Qorma"];
  List<String> details = [
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple"
  ];
  List<String> price = ["3.45", "4.45", "5.45", "6.45"];
  List<String> rating = ["4.5", "4.4", "5.4", "1.4"];
  List<String> imageUril = [
    "https://images.unsplash.com/photo-1475090169767-40ed8d18f67d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1539136788836-5699e78bfc75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
  ];
  List<String> reviewCount = ["25", "25", "25", "25"];
  late SharedPreferences sharedPreferences;
  int themeValue = 0;

  List<String> tabItems = ["All", "Legends", "Bundles", "AdditionalBundles"];
  int current = 0;
  // List<Widget> tabItemsList = [PopularItemCard(name: name[index], details: details[index], rating: rating[index], reviewsCount: reviewCount[index], imageUrl: imageUril[index], price: price[index]]


  @override
  void initState() {
    // TODO: implement initState
    sharedPreferences = Get.find<SharedPreferences>();
    themeValue = sharedPreferences.getInt(AppConstants.THEMEVALUE) ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "Featured items", color: widget.themeValue == 1 ? darkThemeFontColor: fontColor,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                child: Container(
                  width: 14.w,
                  height: 14.h,
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
            ],
          ),
        ),
        SizedBox(
          height: 240.h,
          width: ScreenUtil().screenWidth,
          child: ListView.builder(
              itemCount: name.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(
                      8),
                  child: FeatureItemCard(
                      name: name[index],
                      details: details[index],
                      rating: rating[index],
                      reviewsCount: reviewCount[index],
                      imageUrl: imageUril[index],
                      price: price[index], themeValue: widget.themeValue,),
                );
              }),
        ),
        Container(
          margin: EdgeInsets.all(5),
          width: ScreenUtil().screenWidth,
          // height: 100,
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                    itemCount: tabItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        current = index;

                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5).w,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      // width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(color: greayColor),
                          borderRadius: BorderRadius.circular(25.r),
                          color: current == index ? orangeColor: Colors.white),
                      child: Center(child: SmallText(text: tabItems[index],color: current == index ? Colors.white : loginPageLabelColor, size: 15.sp,),),
                    ),
                  );

                }),
              ),

              SizedBox(
                height: 280.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                  itemCount: name.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return  PopularItemCard(name: name[index], details: details[index], rating: rating[index], reviewsCount: reviewCount[index], imageUrl: imageUril[index], price: price[index], themeValue: themeValue,);

              }))
            ],
          ),
        )
      ],
    );
  }
}
