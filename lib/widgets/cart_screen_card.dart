import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class CartScreenCard extends StatefulWidget {
  const CartScreenCard({Key? key}) : super(key: key);

  @override
  _CartScreenCardState createState() => _CartScreenCardState();
}

class _CartScreenCardState extends State<CartScreenCard> {
  int dishCount = 0;
  bool addPressed = false;
  bool subtractPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  "https://images.unsplash.com/photo-1552611052-33e04de081de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vZCUyMGltYWdlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
                  width: 82.w,
                  height: 82.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Red n hot pizza", size: 18.sp),
                  SmallText(
                    text: "Spicy chicken, beef",
                    size: 12.sp,
                    color: cartDescriptionTextColor,
                  ),

                  SizedBox(height: 20.h,),

                  BigText(
                    text: "\$15.30",
                    color: orangeColor,
                    size: 20.sp,
                  ),
                ],
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.clear,
                color: orangeColor,
                size: 11.7,
              ),
            ),
            SizedBox(height: 30.h,),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      print("pressed");
                      if (dishCount == 0) {
                        subtractPressed = true;
                        addPressed = false;

                        // Fluttertoast.showToast(
                        //     msg: "Count can't be less than 0",
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.BOTTOM);
                      } else {
                        subtractPressed = true;
                        addPressed = false;
                        dishCount--;
                      }
                    });
                  },
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    // padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: ShapeDecoration(
                        shape:  RoundedRectangleBorder(
                            side: const BorderSide(color: orangeColor),
                            borderRadius: BorderRadius.all(
                                Radius.circular(30.r))),
                        color: subtractPressed
                            ? orangeColor
                            : Colors.white),
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        size: 10,
                        color: subtractPressed
                            ? Colors.white
                            : orangeColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  dishCount.toString(),
                  maxLines: 1,
                  style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize:
                    16.sp,
                    fontFamily: 'Sofia Pro Bold',
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      dishCount++;
                      addPressed = !addPressed;
                      subtractPressed = false;
                    });
                  },
                  child: Container(
                    width: 28,
                    height: 28,
                    // padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: orangeColor),
                            borderRadius: BorderRadius.all(
                                Radius.circular(30))),
                        color:
                        addPressed ? orangeColor : Colors.white),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 10,
                        color:
                        addPressed ? Colors.white : orangeColor,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],)
        ],
      ),
    );
  }
}
