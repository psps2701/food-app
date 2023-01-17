import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final textInputType;
  bool isObscure;
  bool isPass;
  var themeValue;


  AppTextField(
      {Key? key,
        required this.textController,
        required this.hintText,
        required this.textInputType,
        this.isPass = false,
        this.isObscure = false,
      this.themeValue = 0})
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      // padding: EdgeInsets.all(10),
      style: NeumorphicStyle(
          shape: widget.themeValue == 0 ? NeumorphicShape.concave : NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: widget.themeValue == 0 ? -4 : 0,
          intensity:widget.themeValue == 0 ?  0.7 : 0,
          lightSource: LightSource.top,
          color: widget.themeValue == 0 ? Colors.white.withOpacity(0.8) : darkThemeContainerColor
      ),
      child: TextField(
        obscureText: widget.isObscure ? true : false,
        controller: widget.textController,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          suffixIcon: Visibility(
            visible: widget.isPass ? true  :false,
            child: GestureDetector(
                onTap: (){
                  setState(() {
                    widget.isObscure = !widget.isObscure;
                  });
                },
                child: Icon(Icons.remove_red_eye, color: passwordObsecureColor,)),
          ),
          hintStyle:  TextStyle(color: hintTextColor, fontSize: MediaQuery.of(context).size.height/52.75),
          hintText: widget.hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
            borderSide: const BorderSide(
              width: 2.0,
              color: orangeColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
            borderSide:  BorderSide(
              width: 2.0,
              color: widget.themeValue == 0 ? textFieldBorderColor : darkThemeContainerColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
            borderSide: const BorderSide(
              width: 2.0,
              color: Colors.blue,
            ),
          ),
        ),
      )

      // Container(
      //   width: double.infinity,
      //   margin: EdgeInsets.only(
      //       left: MediaQuery.of(context).size.height/90.2, right: MediaQuery.of(context).size.height/90.2),
      //   decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/80.27),
      //
      //
      //   ),
      //   child: ,
      // ),
    );
  }
}
