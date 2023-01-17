import 'package:flutter/material.dart';
import 'package:foodoma_app/screens/category_screen.dart';
import 'package:foodoma_app/screens/food_detail.dart';
import 'package:foodoma_app/screens/home_screens/home_grid_view.dart';
import 'package:foodoma_app/screens/home_screens/home_list_view.dart';
import 'package:foodoma_app/screens/search_screen.dart';
import 'package:foodoma_app/utils/app_constants.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/conatiner_with_image.dart';
import 'package:foodoma_app/widgets/dish_container_box.dart';
import 'package:foodoma_app/widgets/food_container_with_icon.dart';
import 'package:foodoma_app/widgets/popular_item_card.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:foodoma_app/widgets/text_field_with_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTextField = TextEditingController();
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  int _page = 0;
  late PageController pageController;
  late SharedPreferences sharedPreferences;

  int themeValue = 0;


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
    "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
  ];
  List<String> popularItemReviewCount = ["25", "25", "25", "25"];
  bool listPressed = false;
  bool gridPressed = true;


  // final TextEditingController _passwordTextController = TextEditingController();

  void navigateToFoodDetail() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>  FoodDetailPage(themeValue: themeValue,)));
  }

  void navigateToSearchScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SearchScreen()));
  }

  void navigateToCategoryPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CategoryScreen()));
  }

  List<String> name = ['Burger', "Donat", "Pizza", "Mexican", "Asian"];
  List<String> imageUrl = [
    "assets/home_burger.png",
    "assets/donut.png",
    "assets/mexican.png",
    "assets/pizze.png",
    "assets/pizze.png"
  ];
  List<bool> onPress = [false, true, false, false, false];

  @override
  void initState() {
    // TODO: implement initState
    gridPressed = true;
    sharedPreferences = Get.find<SharedPreferences>();
    themeValue = sharedPreferences.getInt(AppConstants.THEMEVALUE) ?? 0;


    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _searchTextField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        print("pressed");

        setState(() {
          xOffset = 0;
          yOffset = 0;
          scaleFactor = 1;
          isDrawerOpen  = false;
        });
      },
      child: AnimatedContainer(
        decoration:  ShapeDecoration(
            // shadows: [
            //   BoxShadow(
            //     // color: Colors.grey.withOpacity(0.2),
            //       blurRadius: 3,
            //       color: greayColor,
            //       offset: Offset(1, 10))
            // ],
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(isDrawerOpen ? 40: 0))),
            color: themeValue == 0 ? Colors.white : darkThemeBackgroundColor),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor)..rotateY(0),
        duration: Duration(milliseconds: 250),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 5).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Drawer
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            print("tapped");
                            if(isDrawerOpen == true) {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen  = false;
                            }else{
                              isDrawerOpen = true;

                              xOffset = 200.w;
                              yOffset = 200.h;
                              scaleFactor = 0.6;
                            }


                          });
                        },
                        child: Container(
                          width: 38.w,
                          height: 38.h,
                          // padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration:  ShapeDecoration(
                              shadows: themeValue == 1 ?
                            [
                                BoxShadow(
                                    // color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 3,
                                    color: greayColor,
                                    offset: Offset(1, 10))
                              ] : [],
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)).w),
                            color: themeValue == 1 ? darkThemeContainerColor :Colors.white,
                          ),
                          child: Image.asset("assets/menu-icon.png", color: themeValue == 1 ? Colors.white :Colors.black,
                              ),
                        ),
                      ),

                      //Deliver to
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 6.0.w),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 180.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    SmallText(
                                      text: "Deliver to",
                                      size: 12.sp,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: hintTextColor,
                                      size: 12.sp,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SmallText(
                              text: "4102  Pretty View Lane ",
                              size: 12.sp,
                              color: orangeColor,
                            ),
                          ],
                        ),
                      ),

                      // User image
                      Container(
                        width: 30.w,
                        height: 30.h,
                        // padding: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration:  ShapeDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/user-image.png",
                              ),
                            ),
                            // shadows: [
                            //   BoxShadow(
                            //     // color: Colors.grey.withOpacity(0.2),
                            //       blurRadius: 3,
                            //       color: greayColor,
                            //       offset: Offset(1, 10))
                            // ],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10).w)),
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  // Haading text
                  // SizedBox(
                  //   height: 40.h,
                  // ),

                  //Search row
                  GestureDetector(
                    onTap: (){
                      navigateToSearchScreen();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Container(
                          height: 51.h,
                          width: 205.w,
                          padding: EdgeInsets.all(6).w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(color: themeValue == 1 ? darkThemeContainerColor:textFieldBorderColor)
                          ),
                          child: Row(children: [
                            Icon(Icons.search_outlined, color: orangeColor,),
                            SizedBox(width: 5.w,),
                            BigText(text: "Find for food or restaurant...",size: 12.sp,color: Colors.grey,)
                          ],),
                        ),
                        // IconAppTextField(
                        //   textController: _searchTextField,
                        //   icon: Icons.search_outlined,
                        //   hintText: "Find for food or restaurant...",
                        // ),
                        // Flexible(child: Container()),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  listPressed = false;
                                  gridPressed = true;
                                });
                                // return navigateToCategoryPage();
                              },
                              child: ImageContainer(
                                imageName: "assets/grid_option.png",
                                width: 48.w,
                                height: 48.h,
                                isPressed: gridPressed, themeValue: themeValue,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(

                              onTap: () {

                                setState(() {
                                  listPressed = true;
                                  gridPressed = false;
                                });

                                // return navigateToCategoryPage();
                              },
                              child: ImageContainer(
                                imageName: "assets/list_option.png",
                                width: 48.w,
                                height: 48.h,
                                isPressed: listPressed, themeValue: themeValue,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 1.sw,
                    height: 130.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: name.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0).w,
                              child: FoodVertialContainer(
                                name: name[index],
                                imageUrl: imageUrl[index],
                                onPressed: onPress[index], themeValue: themeValue,
                              ),
                            )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                 Visibility(
                   visible: gridPressed ? true : false,
                     child: HomeGridView()),
                  Visibility(
                      visible: listPressed ? true : false,
                      child: HomeListView(themeValue: themeValue,)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
