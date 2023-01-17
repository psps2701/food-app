import 'package:flutter/material.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/review_card.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final TextEditingController _reviewSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              // crossAxisAlignment:CrossAxisAlignment.center ,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0).r,
                  child: CustomBackButton(),
                ),
                SizedBox(width: 90.w,),
                BigText(text: "Reviews",size: 18.sp,),
              ],
            ),
            SizedBox(height: 20,),

            Container(
              width: 350.w,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height/90.2, right: MediaQuery.of(context).size.height/90.2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: 3,
                //     spreadRadius: 1,
                //     offset: const Offset(1, 10),
                //     color: Colors.grey.withOpacity(0.2),
                //   )
                // ]

              ),
              child: TextField(
                controller: _reviewSearchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.w),
                    child: CircleAvatar(
                      radius: 15.r,
                      backgroundImage: AssetImage(
                        "assets/sidemenuuser.png",
                      ),
                    ),
                  ),
                  hintStyle:  TextStyle(color: blackColor, fontSize: 14.sp),
                  hintText: "Write your review...",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: textFieldBorderColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: textFieldBorderColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Expanded(child: Container(
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0).r,
                  child: ReviewCard(),
                );
              }),
            ))
          ],
        ),
      ),
    );
  }
}
