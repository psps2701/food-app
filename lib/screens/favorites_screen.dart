import 'package:flutter/material.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/category_screen_food_container.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with TickerProviderStateMixin {
  late TabController tabController;
  List<String> items = ["Food Items", "Resturents"];
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
    "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Zm9vZHxlbnwwfDB8MHx8&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
  ];

  List<String> favResList = [
    "https://images.unsplash.com/photo-1540914124281-342587941389?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1562059390-a761a084768e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDZ8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://plus.unsplash.com/premium_photo-1663840344687-a91e96693fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
  ];

  List<String> reviewCount = ["25", "25", "25", "25"];


  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: CustomBackButton(),
            ),
            BigText(text: "Favorites"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
              child: Container(
                height: 38.h,
                width: 38.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(
                    "assets/sidemenuuser.png",
                  ),)
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(3.w),
          height: 55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0.r),
            border: Border.all(color: orangeColor),
          ),
          child: TabBar(
              indicator: BoxDecoration(
                  color: orangeColor,
                  borderRadius: BorderRadius.circular(30.0.r)),
              // labelColor: orangeColor,
              unselectedLabelColor: orangeColor,
              controller: tabController,
              tabs: const [
                Tab(
                  text: "Food Items",
                ),
                Tab(
                  text: "Resturents",
                )
              ]),
        ),

        Expanded(child: Container(
          child: TabBarView(
            controller: tabController,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: name.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        // onTap: () => navigateToFoodDetail(),
                          child: CategoryScreenFoodContainer(
                            name: name[index],
                            details: details[index],
                            rating: rating[index],
                            imageUrl: imageUril[index],
                            price: price[index],
                            reviewsCount: reviewCount[index],
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: name.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        // onTap: () => navigateToFoodDetail(),
                          child: CategoryScreenFoodContainer(
                            name: name[index],
                            details: details[index],
                            rating: rating[index],
                            imageUrl: favResList[index],
                            price: price[index],
                            reviewsCount: reviewCount[index],
                          )),
                    )),
              ),
            ],
          ),
        ))

      ],
    ));
  }
}
