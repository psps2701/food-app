import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/controller/theme_controller.dart';
import 'package:foodoma_app/screens/bottom_navigation_bar/main_screen.dart';
import 'package:foodoma_app/screens/provider/theme_provider.dart';
import 'package:foodoma_app/utils/app_constants.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with TickerProviderStateMixin{

  late TabController tabController;
  late TabController themeTabController;
  late SharedPreferences sharedPreferences;

  void navigateToHomeScreen(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainScreen()));

  }

  var themeValue;
  @override
  void initState() {
    // TODO: implement initState

      sharedPreferences = Get.find<SharedPreferences>();
    tabController = TabController(length: 2, vsync: this);
    themeValue = sharedPreferences.getInt(AppConstants.THEMEVALUE) ?? 0;
    print(themeValue);

    themeTabController = TabController(length: 2, vsync: this, initialIndex: sharedPreferences.getInt(AppConstants.THEMEVALUE) ??0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeValue == 0 ? Colors.white : darkThemeBackgroundColor,
       body: SafeArea(
         child: Column(
           children: [
             Padding(
               padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.06),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Padding(
                     padding: EdgeInsets.only(left: 20),
                     child: GestureDetector(
                       onTap: (){
                         navigateToHomeScreen();
                       },
                       child: Container(
                         width: 38,
                         height: 38,
                         padding: EdgeInsets.symmetric(horizontal: 15),
                         decoration:  ShapeDecoration(
                             shadows: [
                               BoxShadow(
                                 blurRadius: 3,
                                 spreadRadius: 1,
                                 offset: const Offset(1, 10),
                                 color: Colors.grey.withOpacity(0.2),
                               )
                             ],
                             shape: RoundedRectangleBorder(
                                 borderRadius:
                                 BorderRadius.all(Radius.circular(10))),
                             color: themeValue == 0 ? Colors.white : blackColor),
                         child:   Icon(Icons.arrow_back_ios, size: 15,color: themeValue == 0 ? blackColor : Colors.white),
                       ),
                     ),
                   ),
                   SizedBox(width: MediaQuery.of(context).size.width * 0.25,),
                   BigText(text: "Settings", size: 18.sp,color: themeValue == 0? Color(0xFF332b2b) : Colors.white ,),
                 ],
               ),
             ),

             Stack(
               clipBehavior: Clip.none,
               children: [
                 Container(
                   padding: EdgeInsets.only(bottom: 30),
                   width: 323.w,
                   height: 90.h,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r), color: themeValue == 0 ? textFieldBorderColor: Colors.black12),
                   child:                Center(child: BigText(text: "LANGUAGE", size: 16.sp, color: themeValue == 0 ? Color(0xFF332b2b) : Colors.white,)),
                 ),

                 Positioned(
                   right: -0,
                   bottom: -15,
                   child: Container(
                     padding: EdgeInsets.only(left: 10),
                     width: 70.w,
                     height: 55.h,
                     decoration: BoxDecoration(
                       color: orangeColor,
                       borderRadius: BorderRadius.circular(25.0),
                       border: Border.all(color: tabBorderColor),
                     ),
                     child: Center(
                       child: Padding(
                         padding: const EdgeInsets.only(left: 10.0),
                         child: SizedBox(
                             width:19,
                             height: 19,
                             child: Image.asset("assets/language_logo.png", color: themeValue == 1 ? Color(0xFF332b2b) : Colors.white,)),
                       ),
                     ),

                   ),
                 ),

                 Positioned(
                   bottom: -20,
                   left: -10,
                   // right: 0,
                   child: Container(
                     margin: EdgeInsets.all(5),
                     width: 290.w,
                     height: 55.h,
                     padding: EdgeInsets.all(3.w),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(25.0),
                       border: Border.all(color: tabBorderColor),
                     ),
                     child: TabBar(

                         onTap: (index){
                           print(index);
                         },
                         indicator: BoxDecoration(
                             color: orangeColor,
                             borderRadius: BorderRadius.circular(25.0)),
                         // labelColor: orangeColor,
                         unselectedLabelColor: orangeColor,
                         controller: tabController,
                         tabs: const [
                           Tab(
                             text: "English (EN)",
                           ),
                           Tab(
                             text: "Ελληνικά (GR)",
                           )
                         ]),
                   ),
                 ),
               ],
             ),


             SizedBox(height: 75.h,),

             Stack(
               clipBehavior: Clip.none,
               children: [
                 Container(
                   padding: EdgeInsets.only(bottom: 30),
                   width: 323.w,
                   height: 90.h,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r), color: themeValue == 0 ? textFieldBorderColor: Colors.black12),
                   child:                Center(child: BigText(text: "THEME", size: 16.sp,color:themeValue == 0 ? Color(0xFF332b2b): Colors.white)),
                 ),

                 Positioned(
                   right: -0,
                   bottom: -15,
                   child: Container(
                     padding: EdgeInsets.only(left: 10),
                     width: 70.w,
                     height: 55.h,
                     decoration: BoxDecoration(
                       color: orangeColor,
                       borderRadius: BorderRadius.circular(25.0),
                       border: Border.all(color: tabBorderColor),
                     ),
                     child: Center(
                       child: Padding(
                         padding: const EdgeInsets.only(left: 8.0),
                         child: SizedBox(
                             width:19,
                             height: 19,
                             child: Image.asset("assets/theme_logo.png",color:themeValue == 1 ? Color(0xFF332b2b): Colors.white)),
                       ),
                     ),

                   ),
                 ),

                 Positioned(
                   bottom: -20,
                   left: -10,
                   // right: 0,
                   child: Container(
                     margin: EdgeInsets.all(5),
                     width: 290.w,
                     height: 55.h,
                     padding: EdgeInsets.all(3.w),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(25.0),
                       border: Border.all(color: tabBorderColor),
                     ),
                     child: TabBar(

                         onTap: (index){
                           print("index $index");

                           setState(() {
                             sharedPreferences.setInt(AppConstants.THEMEVALUE, index);

                             provider.toggleTheme(index);

                             themeValue = sharedPreferences.get(AppConstants.THEMEVALUE);
                             print(" this is ${sharedPreferences.get(AppConstants.THEMEVALUE)}");


                           });
                           // print(" Shared prefences ${sharedPreferences.get(AppConstants.THEMEVALUE)}");
                         },
                         indicator: BoxDecoration(
                             color: orangeColor,
                             borderRadius: BorderRadius.circular(25.0)),
                         // labelColor: orangeColor,
                         unselectedLabelColor: orangeColor,
                         controller: themeTabController,
                         tabs: const [
                           Tab(
                             text: "Light Mode",

                           ),
                           Tab(
                             text: "Dark Mode",

                           )
                         ]),
                   ),
                 ),
               ],
             ),


             Expanded(child: Container()),

             Image.asset("assets/foodoma_bottom_logo.png",height: 44.h,),
             SizedBox(height: 10.h,)


           ],
         ),
       ),
    );
  }
}
