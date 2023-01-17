import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/home_listview_card.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class HomeListView extends StatefulWidget {
   int themeValue = 0 ;
   HomeListView({Key? key, required this.themeValue}) : super(key: key);

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: BigText(text: "All restaurants", size: 18.sp,color: widget.themeValue == 1 ? darkThemeFontColor:fontColor,),
        ),

        Container(
          // width: 43.w,
          // height: 69.h,
          // padding: const EdgeInsets.all(10).w,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: HomeListViewCard(themeValue: widget.themeValue,),
            );
          })

        ),
      ],
    );
  }
}
