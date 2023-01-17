import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> with TickerProviderStateMixin{
  late TabController tabController;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }



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
              SizedBox(width: MediaQuery.of(context).size.width * 0.25,),
              BigText(text: "Payment Method", size: 18.sp,),
            ],
          ),

          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 30),
                width: 323.w,
                height: 90.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r), color: textFieldBorderColor),
                child:                Center(child: BigText(text: "PAY WITH", size: 16.sp,)),
              ),

              Positioned(
                right: -0,
                bottom: -15,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  width: 70.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    color: orangeColor,
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(color: tabBorderColor),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                          width:19,
                          height: 19,
                          child: Image.asset("assets/payment_method_logo.png",)),
                    ),
                  ),

                ),
              ),

              Positioned(
                bottom: -20,
                left: -10,
                // right: 0,
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: 290.w,
                  height: 55.h,
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(color: tabBorderColor),
                  ),
                  child: TabBar(

                      onTap: (value){
                        print(value);
                        setState(() {
                          index = value;
                        });
                      },
                      indicator: BoxDecoration(
                          color: orangeColor,
                          borderRadius: BorderRadius.circular(25.0)),
                      // labelColor: orangeColor,
                      unselectedLabelColor: orangeColor,
                      controller: tabController,
                      tabs:  [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: BigText(text: "Card", color: index == 0 ? Colors.white:orangeColor,size: 14.sp,),
                            ),
                            Image.asset("assets/pay_card_logo.png", width: 19,color: index == 0 ? Colors.white:orangeColor,),


                          ],),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: BigText(text: "Cash", color: index == 1 ? Colors.white:orangeColor,size: 14.sp,),
                            ),
                            Image.asset("assets/cash_logo.png", height: 14,color: index == 1? Colors.white:orangeColor,),


                          ],),
                        ),
                      ]),
                ),
              ),
            ],
          ),


          SizedBox(height: 75.h,),


          Expanded(child: Container()),

          Image.asset("assets/foodoma_bottom_logo.png",height: 44.h,),
          SizedBox(height: 10.h,)


        ],
      ),
    );
  }
}
