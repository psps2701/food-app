import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/screens/cart_screen.dart';
import 'package:foodoma_app/screens/favorites_screen.dart';
import 'package:foodoma_app/screens/home_screens/home_page.dart';
import 'package:foodoma_app/screens/home_screens/home_screen.dart';
import 'package:foodoma_app/screens/profile_screen.dart';
import 'package:foodoma_app/screens/review_screen.dart';
import 'package:foodoma_app/utils/app_constants.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _page = 0;
  late PageController pageController;
  int currentIndex = 0;

  List<String> imagePath = ["assets/gep.png", "assets/location.png","assets/cart.png","assets/fav.png","assets/notification.png" ];
  late SharedPreferences sharedPreferences;

  int themeValue = 0 ;

  @override
  void initState() {
    // TODO: implement initState
    sharedPreferences = Get.find<SharedPreferences>();
    themeValue = sharedPreferences.getInt(AppConstants.THEMEVALUE) ?? 0;

    print("in home page $themeValue");
    super.initState();
    pageController = PageController();
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    // this will act as a link between tab bar and the pageView widget in the scaffold body.
    pageController.jumpToPage(page);
  }


  @override
  Widget build(BuildContext context) {

    const mainScreenItems = [
      HomePage(),
      ReviewScreen(),
      // AddPostScreen(),
      CartScreen(),
      FavoriteScreen(),
      ProfileScreen()
    ];

    // getting _user data from Provider changeNotifier extented class UserProvider.
    // model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: themeValue == 1 ? darkThemeBackgroundColor: Colors.white,


      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        children: mainScreenItems,
      ),
      bottomNavigationBar: Container(
        // width: 3.w,
        height: 70.h,
        color: themeValue == 1 ? darkThemeBackgroundColor: Colors.white,
        child: Container(
          margin: const EdgeInsets.all(10).w,
          padding: EdgeInsets.all(14),

          decoration: BoxDecoration(
              color: themeValue == 1 ? darkThemeBottomNavigationBarColor: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            // border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(30).r
          ),
          child: ListView.builder(
            shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
            return InkWell(
              // splashColor: orangeColor,
              highlightColor: orangeColor,

              onTap: (){
                setState(() {
                  currentIndex = index;
                  HapticFeedback.mediumImpact();
                  navigationTapped(index);

                });
              },

              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Image.asset(imagePath[index], color: currentIndex == index ? orangeColor : bottomNavigationItemColors,),
              ),


            );
          }),
        )


        // CupertinoTabBar(
        //   backgroundColor: Colors.white,
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: Padding(
        //           padding: const EdgeInsets.only(top: 10.0),
        //           child: Image.asset("assets/gep.png", width: 30,),
        //         ),
        //         ),
        //     BottomNavigationBarItem(
        //         icon: Padding(
        //           padding: const EdgeInsets.only(top: 10.0),
        //           child: Image.asset("assets/location.png"),
        //         ),
        //         backgroundColor: Colors.white),
        //     BottomNavigationBarItem(
        //         icon: Padding(
        //           padding: const EdgeInsets.only(top: 10.0),
        //           child: Image.asset("assets/cart.png"),
        //         ),
        //         ),
        //     BottomNavigationBarItem(
        //         icon: Padding(
        //           padding: const EdgeInsets.only(top: 10.0),
        //           child: Image.asset("assets/fav.png"),
        //         ),
        //         ),
        //     BottomNavigationBarItem(
        //         icon: Padding(
        //           padding: const EdgeInsets.only(top: 10.0),
        //           child: Image.asset("assets/notification.png"),
        //         ),
        //        ),
        //   ],
        //   onTap: navigationTapped,
        // ),
      ),
    );
  }
}
