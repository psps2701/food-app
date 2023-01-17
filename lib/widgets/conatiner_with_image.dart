import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/inner_shadow.dart';

class ImageContainer extends StatefulWidget {
  String imageName;
  bool withShadow = false;
  double width;
  double height;
  bool isPressed;
  final int themeValue;

   ImageContainer({Key? key, required this.imageName, this.withShadow = false, required this.height, required this.width, this.isPressed = false, required this.themeValue}) : super(key: key);

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      blur: 5,
      color:  widget.isPressed == true ? Colors.black12 : greayColor,
      offset: const Offset(0.5, 0.5),
      child: Container(
        width: widget.width,
        height: widget.height,
        // padding: EdgeInsets.symmetric(horizontal: 15),
        decoration:  ShapeDecoration(

            shadows: [
               BoxShadow(
                color: greyColor,
              ),
               BoxShadow(
                color: greyColor,
                spreadRadius: -5.0,
                blurRadius: 10.0,
              ),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            color: widget.isPressed ? orangeColor : widget.themeValue == 1 ?darkThemeContainerColor :Colors.white),
        child: Image.asset(widget.imageName, color: widget.isPressed ? Colors.white :orangeColor,),
      ),
    );
  }
}
