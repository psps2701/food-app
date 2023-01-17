import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/order_screens_widgets/order_detail_header_card.dart';
import 'package:foodoma_app/widgets/order_screens_widgets/order_food_card.dart';
import 'package:foodoma_app/widgets/order_screens_widgets/user_detail_card.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Appbar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: CustomBackButton(),
              ),
              BigText(text: "My Orders", size: 18.sp,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
                child: Container(
                  height: 38.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage(
                        "assets/sidemenuuser.png",
                      ),)
                  ),
                ),
              ),
            ],
          ),
// Header card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: HearderCard(),
          ),

          SizedBox(height: 30.h,),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: UserDetailCard(),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BigText(text: "Orders food", size: 18.sp,),
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.h),
            child: OrderFoodCard(),
          ),
          Container(
            child: Image.asset("assets/card_image.png"),
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.h),
            child: Row(
              children: [
                SmallText(text: "Total",size: 16.sp,fontWeight: FontWeight.w600,color: orderDetailTextColor,),
                Expanded(child: Container()),

                BigText(text: "€59.08", size: 18.sp,),
                SmallText(text: "EUR",size: 14.sp,color: loginPageLabelColor,),


              ],
            ),
          )

        ],
      ),
    );
  }
}
