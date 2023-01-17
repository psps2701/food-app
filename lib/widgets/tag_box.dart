import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class TagBoxWidget extends StatelessWidget {
  final tagLAbel;
  final Color color;
  final Color textColor;
  //  final double width;
  // final double height;
  final int themeValue;
  final int labelSize;
   TagBoxWidget({
  super.key, required this.tagLAbel, this.color = orangeColor, this.textColor = Colors.white,  this.labelSize = 12, required this.themeValue
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 54.w,
      // height: 22.h,
      padding: EdgeInsets.all(8).r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: color

      ),
      child: Center(child: SmallText(text: tagLAbel, color: themeValue == 1 ? darkThemeFontColor:textColor, size: labelSize.toDouble(),)),
    );
  }
}
