import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanCadScreen extends StatefulWidget {
  const ScanCadScreen({Key? key}) : super(key: key);

  @override
  _ScanCadScreenState createState() => _ScanCadScreenState();
}

class _ScanCadScreenState extends State<ScanCadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                text: "Scan Card",
                size: 18.sp,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 51.0),
            child: Center(child: Text("Please hold the card inside the frame to start scaning",style: GoogleFonts.poppins(color: scanCardTextColor, fontSize: 16.sp, fontWeight: FontWeight.w400,),textAlign: TextAlign.center,)),
          ),
          
          Image.asset("assets/scan_card.png"),
          Center(
            child: GestureDetector(

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
                  child: BigText(text: "SCANNING...",size: 15.sp, color: Colors.white,)

                // Text(
                //   'LOGIN',
                //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                // ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
