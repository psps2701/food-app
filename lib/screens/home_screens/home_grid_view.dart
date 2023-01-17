import 'package:flutter/material.dart';
import 'package:foodoma_app/screens/category_screen.dart';
import 'package:foodoma_app/screens/food_detail.dart';
import 'package:foodoma_app/screens/resturant_profile_screens/resturant_profile_screen.dart';
import 'package:foodoma_app/utils/app_constants.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/dish_container_box.dart';
import 'package:foodoma_app/widgets/popular_item_card.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeGridView extends StatefulWidget {
  const HomeGridView({Key? key}) : super(key: key);

  @override
  _HomeGridViewState createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  List<String> popularItemName = ["Chicken Hawaiian", "Chicken", "Biryani", "Qorma"];
  List<String> popularItemDetails = [
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple"
  ];
  List<String> popularItemPrice = ["3.45", "4.45", "5.45", "6.45"];
  List<String> popularItemRating = ["4.5", "4.4", "5.4", "1.4"];
  List<String> popularItemImageUrl = [
    "https://images.unsplash.com/photo-1475090169767-40ed8d18f67d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1539136788836-5699e78bfc75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
  ];
  List<String> popularItemReviewCount = ["25", "25", "25", "25"];
  bool listPressed = false;
  bool gridPressed = false;
  late SharedPreferences sharedPreferences;
  int themeValue = 0;


  // final TextEditingController _passwordTextController = TextEditingController();

  void navigateToFoodDetail() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>  ResturantProfileScreen(themeValue: themeValue,)));
  }

  void navigateToFoodDetailPagee() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>  FoodDetailPage(themeValue: themeValue)));
  }

  List<String> name = ['Burger', "Donat", "Pizza", "Mexican", "Asian"];
  List<String> imageUrl = [
    "assets/burger.png",
    "assets/donut.png",
    "assets/mexican.png",
    "assets/pizze.png",
    "assets/pizze.png"
  ];
  List<bool> onPress = [false, true, false, false, false];

  @override
  void initState() {
    // TODO: implement initState

    sharedPreferences = Get.find<SharedPreferences>();
    themeValue = sharedPreferences.getInt(AppConstants.THEMEVALUE) ?? 0;
    print(themeValue);



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: "Featured Restaurants",
                size: 18.sp,
                color: themeValue == 1 ? Colors.white:Color(0xFF332b2b),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 22.0),
                child: Row(
                  children: [
                    SmallText(
                      text: "View All",
                      size: 16.sp,
                      color: orangeColor,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12.w,
                      color: orangeColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 15.h,),

        Container(
          width: ScreenUtil().screenWidth,
          height: 250.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: name.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                    onTap: () => navigateToFoodDetail(),
                    child: FeatureResturantContainer(themeValue: themeValue,)),
              )),
        ),

        SizedBox(height: 30.h,),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: BigText(
            text: "Popular items",
            size: 18.sp,
            color: themeValue == 1 ? darkThemeFontColor : fontColor,
          ),
        ),

        Container(
          // width: ScreenUtil().screenWidth,
          height:280.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: popularItemName.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => navigateToFoodDetailPagee(),
              child: PopularItemCard(name: popularItemName[index], details: popularItemDetails[index], rating: popularItemRating[index], reviewsCount: popularItemReviewCount[index],imageUrl: popularItemImageUrl[index], price: popularItemPrice[index], themeValue: themeValue, ),
            ),
          ),
        )
      ],
    );
  }
}
