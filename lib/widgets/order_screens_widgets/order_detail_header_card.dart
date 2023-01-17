import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class HearderCard extends StatefulWidget {
  const HearderCard({Key? key}) : super(key: key);

  @override
  _ResturantDetailCardState createState() => _ResturantDetailCardState();
}

class _ResturantDetailCardState extends State<HearderCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 65.h,
          width: 65.w,
          padding: EdgeInsets.all(8),
          decoration: ShapeDecoration(
            color: Colors.white,
            shadows: const [
              BoxShadow(
                // color: Colors.grey.withOpacity(0.2),
                  blurRadius: 3,
                  color: greayColor,
                  offset: Offset(1, 10))
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.of(context).size.height / 42.2))),
          ),
          child: Image.network(
            height: 46.h,
              width: 46.h,
              "https://www.freepnglogos.com/uploads/starbucks-logo-png-25.png"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallText(text: "20 Jun, 10:30", color: loginPageLabelColor,size: 12.sp,),
              Row(
                children: [
                  BigText(text: "Starbuck ", size: 16.sp,),
                  Icon(Icons.check_circle, color: greyColor,size: 10,)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, size: 7, color: orangeColor,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                    child: SmallText(text: "Order Delivered", color: greenColor,size: 12.sp,),
                  ),
                ],
              ),



            ],
          ),
        ),

        Flexible(child: Container()),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SmallText(text: "#264100",color: loginPageLabelColor,size: 18.sp,),
            SizedBox(height: 40.h,)
          ],
        )




      ],
    );
  }
}
