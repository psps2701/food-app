import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodoma_app/screens/filter_screen/filter_screen.dart';
import 'package:foodoma_app/screens/search_screen/search_screen.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/conatiner_with_image.dart';
import 'package:foodoma_app/widgets/find_resturant_card.dart';
import 'package:foodoma_app/widgets/order_screens_widgets/history_card.dart';
import 'package:foodoma_app/widgets/order_screens_widgets/my_order_card.dart';
import 'package:foodoma_app/widgets/popular_item_card.dart';
import 'package:foodoma_app/widgets/search_food_card.dart';
import 'package:foodoma_app/widgets/text_field_with_icon.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  List<String> items = ["Food Item", "Restaurant"];
  late TabController tabController;
  final TextEditingController _searchTextField = TextEditingController();
  List<String> popularItemName = [
    "Chicken Hawaiian",
    "Chicken",
    "Biryani",
    "Qorma"
  ];
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
    "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
  ];
  List<String> popularItemReviewCount = ["25", "25", "25", "25"];
  void navigateToFilterScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const FilterScreen()));
  }

  void navigateToSearchScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SearchFoodScreen()));
  }


  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(),

        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1.2 ,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: CustomBackButton()),
                  ),
                  BigText(text: "Search Food"),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 38.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset("assets/sidemenuuser.png")),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [

                    Expanded(
                      child: GestureDetector(
                        onTap: () =>navigateToSearchScreen(),
                        child: Container(
                          height: 51.h,
                          // width: MediaQuery.of(context).size.width * 0.73,
                          padding: EdgeInsets.all(6).w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: textFieldBorderColor)
                          ),
                          child: Row(children: [
                            Icon(Icons.search_outlined),
                            SizedBox(width: 5.w,),
                            BigText(text: "Find for food or restaurant...",size: 14.sp,color: searchTextColor,)
                          ],),
                        ),
                      ),
                    ),
                    //
                    // IconAppTextField(
                    //   textController: _searchTextField,
                    //   icon: Icons.search_outlined,
                    //   hintText: "Find for food or restaurant...",
                    // ),
                   // Expanded(child: Container()),
                    SizedBox(width: 4,),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                          onTap: () {
                            navigateToFilterScreen();
                            setState(() {});
                            // return navigateToCategoryPage();
                          },
                          child: ImageContainer(
                            imageName: "assets/filter_button.png",
                            width: 48.w,
                            height: 48.h, themeValue: 0,
                            // isPressed: gridPressed,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.h),
                child: Container(
                  // margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(color: greayColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TabBar(
                        indicator: BoxDecoration(
                            color: orangeColor,
                            borderRadius: BorderRadius.circular(25.0)),
                        // labelColor: orangeColor,
                        unselectedLabelColor: orangeColor,
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: "Food Item",
                          ),
                          Tab(
                            text: "Restaurant",
                          )
                        ]),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:GridView.custom(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverWovenGridDelegate.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 100,
                          crossAxisSpacing: 20,
                          tileBottomSpace: 20,
                          pattern: [
                            WovenGridTile(1),
                            WovenGridTile(
                              5 / 6,
                              crossAxisRatio: 1,
                              alignment: AlignmentDirectional.centerEnd,
                            ),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                          childCount: popularItemRating.length,
                              (context, index) => SearchFoodCard(
                            name: popularItemName[index],
                            details: popularItemDetails[index],
                            rating: popularItemRating[index],
                            reviewsCount:
                            popularItemReviewCount[index],
                            imageUrl: popularItemImageUrl[index],
                            price: popularItemPrice[index],
                          ),
                        ),
                      ),


                      // GridView.builder(
                      //   physics: NeverScrollableScrollPhysics(),
                      //     gridDelegate:
                      //         SliverGridDelegateWithFixedCrossAxisCount(
                      //             crossAxisCount: 2,
                      //             mainAxisSpacing:
                      //                 MediaQuery.of(context).size.height *
                      //                     0.12,
                      //             crossAxisSpacing:
                      //                 MediaQuery.of(context).size.width *
                      //                     0.03),
                      //     shrinkWrap: false,
                      //     itemCount: popularItemPrice.length,
                      //     itemBuilder: (context, index) => SearchFoodCard(
                      //           name: popularItemName[index],
                      //           details: popularItemDetails[index],
                      //           rating: popularItemRating[index],
                      //           reviewsCount:
                      //               popularItemReviewCount[index],
                      //           imageUrl: popularItemImageUrl[index],
                      //           price: popularItemPrice[index],
                      //         )),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:GridView.custom(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverWovenGridDelegate.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 20,
                          tileBottomSpace: 20,
                          pattern: [
                            WovenGridTile(1),
                            WovenGridTile(
                              5 / 6,
                              crossAxisRatio: 1,
                              alignment: AlignmentDirectional.topEnd,
                            ),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                          childCount: popularItemRating.length,
                              (context, index) => FindResurentCard()
                        ),
                      ),


                      // GridView.builder(
                      //   physics: NeverScrollableScrollPhysics(),
                      //     gridDelegate:
                      //         SliverGridDelegateWithFixedCrossAxisCount(
                      //             crossAxisCount: 2,
                      //             mainAxisSpacing:
                      //                 MediaQuery.of(context).size.height *
                      //                     0.12,
                      //             crossAxisSpacing:
                      //                 MediaQuery.of(context).size.width *
                      //                     0.03),
                      //     shrinkWrap: false,
                      //     itemCount: popularItemPrice.length,
                      //     itemBuilder: (context, index) => SearchFoodCard(
                      //           name: popularItemName[index],
                      //           details: popularItemDetails[index],
                      //           rating: popularItemRating[index],
                      //           reviewsCount:
                      //               popularItemReviewCount[index],
                      //           imageUrl: popularItemImageUrl[index],
                      //           price: popularItemPrice[index],
                      //         )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
