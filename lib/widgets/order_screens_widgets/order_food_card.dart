import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class OrderFoodCard extends StatefulWidget {
  const OrderFoodCard({Key? key}) : super(key: key);

  @override
  _OrderFoodCardState createState() => _OrderFoodCardState();
}

class _OrderFoodCardState extends State<OrderFoodCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 82.h,
          width: 82.w,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                  fit: BoxFit.cover,
                  "https://images.unsplash.com/photo-1475090169767-40ed8d18f67d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60")),
        ),
        SizedBox(width: 20.w,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(text: "Red n hot pizza", size: 18.sp,),
            SmallText(text: "Spicy chicken, beef", size: 13.sp, fontWeight: FontWeight.w500,color: loginPageLabelColor,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BigText(text: "€", size: 18.sp,color: orangeColor,),
                BigText(text: "9.50", size: 18.sp,),
              ],
            ),

          ],
        )
      ],
    );
  }
}
