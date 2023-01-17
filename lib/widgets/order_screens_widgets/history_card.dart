import 'package:flutter/material.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({Key? key}) : super(key: key);

  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.26,
      padding: EdgeInsets.symmetric(horizontal: 15),
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
                    Row(
                      children: [
                        SmallText(text: "20 Jun, 10:30"),
                        SizedBox(width: 5,),
                        Icon(Icons.circle,size: 5, color: loginPageLabelColor,),
                        SizedBox(width: 5,),
                        SmallText(text: "3 items", color: loginPageLabelColor,),
                      ],
                    ),
                    Row(
                      children: [
                        BigText(text: "Starbuck "),
                        Icon(Icons.check_circle, color: blackColor,size: 10,)
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.circle, size: 10, color: orangeColor,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                          child: SmallText(text: "Estimated Arrival", color: orangeColor,size: 16,),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Flexible(child: Container()),
              BigText(text: "\$17.10",color: orangeColor,)
            ],
          ),
          SizedBox(height: 20,),

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
                    child: BigText(text: "Rate",size: 20, color: Colors.black,)

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
                    child: BigText(text: "Re-Order",size: 20, color: Colors.white,)

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
    );;
  }
}
