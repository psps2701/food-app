import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/app_text_field.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({Key? key}) : super(key: key);

  @override
  _NewAddressScreenState createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _mobileNumberTextController = TextEditingController();
  final TextEditingController _stateTextController = TextEditingController();
  final TextEditingController _cityTextController = TextEditingController();
  final TextEditingController _streetTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: CustomBackButton()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: BigText(text: "Add new address"),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: 38.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.asset("assets/sidemenuuser.png")),
                  )),
            ],
          ),

          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(width: 10.w,),
              Padding(
                padding: const EdgeInsets.only(bottom: 10).r,
                child: SmallText(text: "Full name", size: 16.sp, color: loginPageLabelColor,),
              ),
            ],
          ),
          AppTextField(textController: _fullNameTextController, hintText: "Your Full name", textInputType:TextInputType.emailAddress, ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              SizedBox(width: 10.w,),
              Padding(
                padding: const EdgeInsets.only(bottom: 10).r,
                child: SmallText(text: "Mobile number", size: 16.sp, color: loginPageLabelColor,),
              ),
            ],
          ),
          AppTextField(textController: _fullNameTextController, hintText: "Your mobile number", textInputType:TextInputType.emailAddress, ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              SizedBox(width: 10.w,),
              Padding(
                padding: const EdgeInsets.only(bottom: 10).r,
                child: SmallText(text: "State", size: 16.sp, color: loginPageLabelColor,),
              ),
            ],
          ),

          Container(

            height: 65.h,

            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: double.infinity,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.height/90.2, right: MediaQuery.of(context).size.height/90.2),
            decoration: BoxDecoration(
              border: Border.all(color: textFieldBorderColor),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SmallText(text: "Select State", size: 16.sp, color: blackColor,),
                Icon(Icons.arrow_forward_ios, color: blackColor,size: 13,)

              ],
            ),


          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              SizedBox(width: 10.w,),
              Padding(
                padding: const EdgeInsets.only(bottom: 10).r,
                child: SmallText(text: "City", size: 16.sp, color: loginPageLabelColor,),
              ),
            ],
          ),

          Container(

            height: 65.h,

            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: double.infinity,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.height/90.2, right: MediaQuery.of(context).size.height/90.2),
            decoration: BoxDecoration(
              border: Border.all(color: textFieldBorderColor),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SmallText(text: "Select City", size: 16.sp, color: blackColor,),
                Icon(Icons.arrow_forward_ios, color: blackColor,size: 13,)

              ],
            ),


          ),

          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              SizedBox(width: 10.w,),
              Padding(
                padding: const EdgeInsets.only(bottom: 10).r,
                child: SmallText(text: "Street (Include house number)", size: 16.sp, color: loginPageLabelColor,),
              ),
            ],
          ),
          AppTextField(textController: _streetTextController, hintText: "Street", textInputType:TextInputType.emailAddress, ),

          SizedBox(
            height: 24.h,
          ),

          Center(
            child: GestureDetector(
              // onTap: () => navigateToHomeScreen(),

              child: Container(
                  width: 248.w,
                  height: 60.h,
                  // height: MediaQuery.of(context).size.height * 0.06,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration:  ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(100.r))),
                      color: orangeColor),
                  child: BigText(text: "Save",size: 15.sp, color: Colors.white,)

                // Text(
                //   'LOGIN',
                //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                // ),
              ),
            ),
          ),

          SizedBox(
            height: 24.h,
          ),


        ],),
      ),
    );
  }
}
