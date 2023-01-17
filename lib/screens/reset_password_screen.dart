import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/app_text_field.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/big_text.dart';

class ResetPasswod extends StatefulWidget {
  const ResetPasswod({Key? key}) : super(key: key);

  @override
  _ResetPasswodState createState() => _ResetPasswodState();
}

class _ResetPasswodState extends State<ResetPasswod> {
  final TextEditingController _resetPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              // fit: StackFit.passthrough,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                      width: 30.w,
                      child: Image.asset("assets/corner_elipse.png")),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                      width: 100.w,

                      child: Image.asset("assets/top_elipse.png")),
                ),
                Positioned(
                  top: -60.h,
                  right: -65.w,
                  child: SizedBox(
                      width: 200,
                      child: Image.asset("assets/right_corner_elipse.png")),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20).r,
                  child: CustomBackButton(),
                ),



              ],
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            child: Text("Please type the verification code sent to prelookstudio@gmail.com", style: GoogleFonts.poppins(fontSize: 14.sp, color: loginPageLabelColor),maxLines: 2,)
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  AppTextField(textController: _resetPasswordTextController, hintText: "Type your Email", textInputType:TextInputType.emailAddress, ),


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
                  SizedBox(height: 51.h,),

                  Center(
                    child: GestureDetector(
                      // onTap: () => navigateToHomeScreen(),

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
                          child: BigText(text: "Send new password",size: 15.sp, color: Colors.white,)

                        // Text(
                        //   'LOGIN',
                        //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                        // ),
                      ),
                    ),
                  ),




                ],),
            ),


          ],
        ),
      ),
    );
  }
}
