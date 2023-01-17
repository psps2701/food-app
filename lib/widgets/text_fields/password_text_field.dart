import 'package:flutter/material.dart';
import 'package:foodoma_app/utils/colors.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final textInputType;
  bool isObscure;

   PasswordTextField({Key? key, required this.textController, required this.hintText, this.textInputType, this.isObscure = false}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: 20,
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.height/90.2, right: MediaQuery.of(context).size.height/90.2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/80.27),
        // boxShadow: [
        //   BoxShadow(
        //     blurRadius: 3,
        //     spreadRadius: 1,
        //     offset: const Offset(1, 10),
        //     color: Colors.grey.withOpacity(0.2),
        //   )
        // ]

      ),
      child: SizedBox(
        // width: 400,
        child: TextField(
          obscureText: _isPressed ? (widget.isObscure ? true : false) : false,
          controller: widget.textController,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            hintStyle:  TextStyle(
                color: hintTextColor, fontSize: 15),
            hintText: widget.hintText,
            // prefixIcon: Image.asset(widget.iconName),
            suffixIcon:  widget.isObscure ? GestureDetector(
                onTap: (){

                  setState(() {
                    _isPressed = !_isPressed;
                  });

                },
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.asset("assets/Obscure.png", width: 16,height: 12,),
                )) : Container(width: 2,),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
              borderSide: const BorderSide(
                width: 2.0,
                color: orangeColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
              borderSide: const BorderSide(
                width: 2.0,
                color: textFieldBorderColor,
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
        ),
      ),
    );
  }
}
