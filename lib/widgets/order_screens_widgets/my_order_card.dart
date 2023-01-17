import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class MyOrderCard extends StatefulWidget {
  const MyOrderCard({Key? key}) : super(key: key);

  @override
  _MyOrderCardState createState() => _MyOrderCardState();
}

class _MyOrderCardState extends State<MyOrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.26,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: ShapeDecoration(
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
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://www.freepnglogos.com/uploads/starbucks-logo-png-25.png")),
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
              ),
              SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: "3 items", color: loginPageLabelColor,),
                    Row(
                      children: [
                        BigText(text: "Starbuck ", size: 16.sp,),
                        Icon(Icons.check_circle, color: greyColor,size: 10,)
                      ],
                    )
                  ],
                ),
              ),
              Flexible(child: Container()),
              BigText(text: "#264100",color: orangeColor,)
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: BigText(text: "Estimated Arrival", color: loginPageLabelColor,),
                  ),
                  RichText(text: const TextSpan(
                    text: "25",
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.black, fontFamily:'Sofia Pro Bold' ),
                    children: [
                      TextSpan(text: "min",style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Sofiapro'))
                    ]
                  )),
                ],
              ),
              Flexible(child: Container()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SmallText(text: "Now", size: 16,),
                  BigText(text: "Food on the way")
                ],
              )
            ],
          ),
          Row(
            children: [
              GestureDetector(
                // onTap: () => navigateToHomeScreen(),

                child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.06,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        shadows: const [
                          BoxShadow(
                            // color: Colors.grey.withOpacity(0.2),
                              blurRadius: 3,
                              color: greayColor,
                              offset: Offset(1, 10))
                        ],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        color: Colors.white),
                    child: BigText(text: "Cancel",size: 20, color: Colors.black,)

                  // Text(
                  //   'LOGIN',
                  //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                  // ),
                ),
              ),
              Flexible(child: Container()),

              GestureDetector(
                // onTap: () => navigateToHomeScreen(),

                child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.06,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        shadows: const [
                          BoxShadow(
                            // color: Colors.grey.withOpacity(0.2),
                              blurRadius: 3,
                              color: shadowOrangeColor,
                              offset: Offset(1, 10))
                        ],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        color: orangeColor),
                    child: BigText(text: "Track Order",size: 20, color: Colors.white,)

                  // Text(
                  //   'LOGIN',
                  //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                  // ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
