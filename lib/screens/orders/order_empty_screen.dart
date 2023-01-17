import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderEmptyScreen extends StatefulWidget {
  const OrderEmptyScreen({Key? key}) : super(key: key);

  @override
  State<OrderEmptyScreen> createState() => _OrderEmptyScreenState();
}

class _OrderEmptyScreenState extends State<OrderEmptyScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.07,),

        Image.asset("assets/order_empty_logo.png", height: 110.h,),
        SizedBox(
          height: 43.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10.w,),
            BigText(text: "No upcoming orders ", size: 20.sp,),
          ],
        ),

        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10.w,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 10).r,
                  child: Text("No upcoming orders have been placed yet. Discover and order now!", style: GoogleFonts.poppins(fontSize: 14.sp, color: loginPageLabelColor),maxLines: 2,textAlign: TextAlign.center,)
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h,),

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
                child: BigText(text: "DISCOVER NOW",size: 15.sp, color: Colors.white,)

              // Text(
              //   'LOGIN',
              //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
              // ),
            ),
          ),
        ),

//36


      ],
    );
  }
}
