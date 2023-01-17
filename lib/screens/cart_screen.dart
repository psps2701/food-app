import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/screens/payment_screens/payment_screen.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/cart_screen_card.dart';
import 'package:foodoma_app/widgets/inner_shadow.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController _promoCodeTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    void navigateToPaymentScreen() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const PaymentSCreen()));
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: GestureDetector(
                      // onTap: navigateToHomeScreen,
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.height * 0.05,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              color: Colors.white),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.26,
                  ),
                  BigText(text: "Cart", size: 18.sp,)
                ],
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index){
                  return  CartScreenCard();

                }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.018,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 90.2,
                    right: MediaQuery.of(context).size.height / 90.2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow: [
                    const BoxShadow(
                      color: greyColor,
                    ),
                    const BoxShadow(
                      color: greyColor,
                      spreadRadius: -12.0,
                      blurRadius: 13.0,
                    ),
                  ],
                ),
                child: TextField(
                  controller: _promoCodeTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            // height: MediaQuery.of(context).size.height * 0.06,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(22))),
                                color: orangeColor),
                            child: BigText(
                              text: "Apply",
                              size: 15,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    hintStyle: TextStyle(
                        color: hintTextColor,
                        fontSize: MediaQuery.of(context).size.height / 52.75),
                    hintText: "Promo Code",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          50.r),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: textFieldBorderColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          50.r),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: textFieldBorderColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height / 75.27),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      text: "Subtotal",
                      color: blackColor,
                      size: 16.sp,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "\$27.30",
                          color: blackColor,
                          size: 21.sp,
                        ),
                        SmallText(text: "USD",color: loginPageLabelColor),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                  height: 1,
                  color: hintTextColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      text: "Tax and Fees",
                      color: blackColor,
                      size: 16.sp,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "\$7.30",
                          color: blackColor,
                          size: 21.sp,
                        ),
                        SmallText(text: "USD",color: loginPageLabelColor),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                  height: 1,
                  color: hintTextColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      text: "Delivery",
                      color: blackColor,
                      size: 16.sp,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "\$2.30",
                          color: blackColor,
                          size: 21.sp,
                        ),
                        SmallText(text: "USD",color: loginPageLabelColor),
                      ],
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                  height: 1,
                  color: hintTextColor,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SmallText(
                          text: "Total",
                          color: blackColor,
                          size: 16.sp,
                        ),
                        SizedBox(width: 4,),
                        SmallText(
                          text: "(2 items)",
                          color: loginPageLabelColor,
                          size: 16,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "\$2.30",
                          color: blackColor,
                          size: 21.sp,
                        ),
                        SmallText(text: "USD",color: loginPageLabelColor),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    navigateToPaymentScreen();
                  },

                  child: Container(

                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.06,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration:  ShapeDecoration(
                        shadows: [
                          BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: const Offset(1, 4),
                            color: shadowOrangeColor,
                          )
                        ],
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                          color: orangeColor),
                      child: BigText(
                        text: "CHECKOUT",
                        size: 15,
                        color: Colors.white,
                      )),
                ),
              )



            ],
          ),
        ),
      ),
    );
  }
}
