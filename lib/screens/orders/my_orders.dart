import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/screens/orders/order_detail_screen.dart';
import 'package:foodoma_app/screens/orders/order_empty_screen.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/order_screens_widgets/history_card.dart';
import 'package:foodoma_app/widgets/order_screens_widgets/my_order_card.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  List<String> items = ["Upcoming", "History"];
  int orders = 0;


  void navigateToOrderDetail(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrderDetailScreen()));

  }

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
            children: [
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
              Container(
                margin: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                height: 55.h,
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: tabBorderColor),
                ),
                child: TabBar(
                  onTap: (index){
                    print(index);
                  },
                    indicator: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(25.0)),
                    // labelColor: orangeColor,
                    unselectedLabelColor: orangeColor,
                    controller: tabController,
                    tabs: const [
                      Tab(
                        text: "Upcoming",
                      ),
                      Tab(
                        text: "History",
                      )
                    ]),
              ),
              orders == 0 ?  Expanded(child: OrderEmptyScreen()):Expanded(
                child: Container(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: (){
                                      navigateToOrderDetail();

                                    },
                                    child: MyOrderCard()),
                              )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                            child: BigText(
                              text: "Latest Orders",
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                      child: HistoryCard()),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
        ),
      ),
    ),
        ));
  }
}
