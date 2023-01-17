import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/address_screen/new_address_screen.dart';
import 'package:foodoma_app/screens/orders/my_orders.dart';
import 'package:foodoma_app/screens/payment_methods/payment_method.dart';
import 'package:foodoma_app/screens/profile_screen.dart';
import 'package:foodoma_app/screens/settings_screens/setting_screen.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:lottie/lottie.dart';

class DrawerScreen extends StatefulWidget {
  final int themeValue;
  const DrawerScreen({Key? key, required this.themeValue}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool _isLoading = false;

  void navigateToProfileScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
  }

  void navigateToMyOrderScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyOrderScreen()));
  }

  void navigateToSettingsScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
  }

  void navigateToPaymentMethodScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PaymentMethod()));
  }

  void navigateToNewAddressScreen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const NewAddressScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 40.r,
                    backgroundImage: AssetImage(
                      "assets/sidemenuuser.png",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.067),
                  child: BigText(
                    text: "Farion Wick",
                    color:
                        widget.themeValue == 1 ? darkThemeFontColor : fontColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.067),
                  child: SmallText(
                    text: "farionwick@gmail.com",
                    color: loginPageLabelColor,
                    size: MediaQuery.of(context).size.height * 0.0177,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => navigateToMyOrderScreen(),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/DrawerDocument.png",
                              height: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "My Orders",
                              color: widget.themeValue == 1
                                  ? darkThemeFontColor
                                  : fontColor,
                              size: MediaQuery.of(context).size.height / 52.75,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Pressed");
                        navigateToProfileScreen();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/Profile.png",
                              height: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "My Profile",
                              color: widget.themeValue == 1
                                  ? darkThemeFontColor
                                  : fontColor,
                              size: MediaQuery.of(context).size.height / 52.75,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => navigateToNewAddressScreen(),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/DrawerLocation.png",
                              height: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "Delivery Address",
                              color: widget.themeValue == 1
                                  ? darkThemeFontColor
                                  : fontColor,
                              size: MediaQuery.of(context).size.height / 52.75,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          navigateToPaymentMethodScreen();
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/Wallet.png",
                              height: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "Payment Methods",
                              color: widget.themeValue == 1
                                  ? darkThemeFontColor
                                  : fontColor,
                              size: MediaQuery.of(context).size.height / 52.75,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/Message.png",
                            height: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "Contact Us",
                            color: widget.themeValue == 1
                                ? darkThemeFontColor
                                : fontColor,
                            size: MediaQuery.of(context).size.height / 52.75,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          navigateToSettingsScreen();
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/Setting.png",
                              height: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "Settings",
                              color: widget.themeValue == 1
                                  ? darkThemeFontColor
                                  : fontColor,
                              size: MediaQuery.of(context).size.height / 52.75,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/Helps.png",
                            height: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                            text: "Helps & FAQs",
                            color: widget.themeValue == 1
                                ? darkThemeFontColor
                                : fontColor,
                            size: MediaQuery.of(context).size.height / 52.75,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/logo_side_menu.png", width: 125.w,),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.076,
                    // ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 4),
        child: Container(
            width: 117.w,
            height: 43.h,
            // height: MediaQuery.of(context).size.height * 0.06,
            alignment: Alignment.center,
            // padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(1, 10),
                color: shadowOrangeColor,
              )
            ], borderRadius: BorderRadius.circular(100.r), color: orangeColor),
            child: _isLoading
                ? Lottie.asset('assets/loader2.json', height: 200)
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/logout_logo.png", width: 26.w,),
                      SizedBox(width: 10.w,),
                      SmallText(
                        text: "Log Out",
                        size: 15.sp,
                        color: Colors.white,
                      ),
                    ],
                  )

            // Text(
            //   'LOGIN',
            //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
            // ),
            ),
      ),
    );
  }
}
