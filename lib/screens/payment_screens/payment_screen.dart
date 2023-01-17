import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/screens/payment_screens/scan_card.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentSCreen extends StatefulWidget {
  const PaymentSCreen({Key? key}) : super(key: key);

  @override
  _PaymentSCreenState createState() => _PaymentSCreenState();
}

class _PaymentSCreenState extends State<PaymentSCreen> {
  @override
  Widget build(BuildContext context) {
    void navigateToScanCardScreen(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScanCadScreen()));

    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: CustomBackButton(),
                  ),
                  SizedBox(
                    width: 98.w,
                  ),
                  BigText(
                    text: "Payment",
                    size: 18.sp,
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: BigText(text: "Shipping to", size: 18.sp,fontWeight: FontWeight.w600,),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 12.h,),
                      Image.asset("assets/address_thubnail.png", height: 97.h,width: 94,fit: BoxFit.fill,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BigText(text: "Home", size: 20.sp,),
                      SizedBox(
                        width: 211.w,

                          child: BigText(text: "4140 Parker Rd. Allentown, New Mexico 31134.",size: 14.sp,color: loginPageLabelColor,fontWeight: FontWeight.w400,))

                    ],
                  )

                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: BigText(text: "Payment Method", size: 18.sp,fontWeight: FontWeight.w600,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                height: 67.h,
                    width: 46.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(color: paymentMethodAddButtonBorderColor),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                          height: 53.h,
                        width: 36.w,

                        decoration: BoxDecoration(
                          border: Border.all(color: paymentMethodAddButtonBorderColor),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.r),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 1,
                              offset: const Offset(1, 10),
                              color: Colors.grey.withOpacity(0.2),
                            )
                          ]
                        ),
                        child: Icon(Icons.add, size: 17,color: orangeColor,),
                      ),
                    ),),

                  Container(
                    height: 67.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: paymentMethodAddButtonBorderColor),
                    ),
                    child: Center(child: Image.asset("assets/Mastercard.png", width: 52.w,height: 32.h, fit: BoxFit.cover,)),
                  ),
                  Container(
                    height: 67.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: paymentMethodAddButtonBorderColor),
                    ),
                    child: Center(child: Image.asset("assets/paypal.png", width: 52.w,height: 32.h, fit: BoxFit.contain,)),
                  ),
                  Container(
                    height: 67.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: paymentMethodAddButtonBorderColor),
                    ),
                    child: Center(child: Image.asset("assets/apple.png", width: 52.w,height: 32.h, fit: BoxFit.contain,)),
                  ),
                ],
              ),
              Image.asset("assets/card_Pic.png"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: "Total Pay", size: 18.sp,),
                    Row(children: [
                      BigText(text: "€59.08", size: 18.sp,),
                      Text("EUR", style: GoogleFonts.poppins(color: loginPageLabelColor,fontWeight: FontWeight.w400),)

                    ],)
                  ],
                ),
              ),

              SizedBox(height: 102.h,),
              Center(
                child: GestureDetector(
                  onTap: () => navigateToScanCardScreen(),

                  child: Container(
                      width: 248.w,
                      height: 60.h,
                      // height: MediaQuery.of(context).size.height * 0.06,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration:  ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(100.r))),
                          color: orangeColor),
                      child: BigText(text: "Confirm Order",size: 15.sp, color: Colors.white,)

                    // Text(
                    //   'LOGIN',
                    //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                    // ),
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
