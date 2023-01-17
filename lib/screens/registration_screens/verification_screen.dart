import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/controller/service_controller.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class VerificationScreen extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  final String lat;
  final String long;
  final String phone;

  const VerificationScreen({Key? key, required this.name, required this.email, required this.password, required this.lat, required this.long, required this.phone}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  OtpFieldController otpController = OtpFieldController();
  bool _isLoading = false;
  String pin = "";

  Future<void> registerUser() async{
    setState(() {
      _isLoading = true;
    });
    String response = await ServiceController().register(fullName: widget.name, email: widget.email, password: widget.password, phone: widget.phone, otp: int.parse(pin), lat: widget.lat, long: widget.long, address: "Random Adress", house: "random", tag: "other");
 if(response == "Success") {
   setState(() {
     _isLoading = false;
   });
 }else {
   setState(() {
     _isLoading = false;
   });
 }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                  width: 150.w,

                  child: Image.asset("assets/top_left.png")),
            ),
          ),
          Positioned(
            top: 0.h,
            right: 0.w,
            child: SizedBox(
                width: 100,
                child: Image.asset("assets/top_right.png")),
          ),
          Positioned(
              top: -10,
              left: 30,
              child: CustomBackButton()),
         _isLoading ?Center(child: Lottie.asset('assets/full_screen_loader.json',)) : Padding(padding: EdgeInsets.only(left: 8.0, right: 8.0, top: MediaQuery.of(context).size.height * 0.2 ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 10.w,),
                  BigText(text: "Verification Code", size: 36.sp,),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SizedBox(width: 10.w,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10).r,
                      child: Text("Please type the verification code sent to ${widget.email} / ${widget.phone}", style: GoogleFonts.poppins(fontSize: 14.sp, color: loginPageLabelColor),maxLines: 2,)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),


              Center(
                child: OTPTextField(
                    controller: otpController,
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 45,
                    otpFieldStyle: OtpFieldStyle(backgroundColor: textFieldBorderColor, focusBorderColor: orangeColor ),
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 5,
                    style: TextStyle(fontSize: 17, color: orangeColor),
                    onChanged: (pin) {
                      print("Changed: " + pin);
                    },
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                      setState(() {
                        pin = pin;
                      });
                      registerUser();
                    }),
              ),

              SizedBox(height: 20.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmallText(text: "I didn’t receive a code! ", color: blackColor,size: MediaQuery.of(context).size.height/52.75,),
                  Column(
                    children: [
                      GestureDetector(
                        // onTap: ()=>navigateToSignUpScreen(),
                          child: SmallText(text: "Please resend", color: orangeColor,size: MediaQuery.of(context).size.height/52.75,)),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.16,
                        height: 2,
                        color: transparentWhiteColor,
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(child: Container()),


              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset("assets/f_logo.png", height: 40.h, width: 40.w,))



            ],),
          ),


        ],
      ),
    );
  }
}
