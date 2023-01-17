import 'package:flutter/material.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/app_text_field.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _mobileNumberTextController = TextEditingController();
  final TextEditingController _cityTextController = TextEditingController();
  final TextEditingController _stateTextController = TextEditingController();
  final TextEditingController _streetTextController = TextEditingController();
  final TextEditingController _fullNameTextController = TextEditingController();

  void navigateToProfileScreen(){
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () => navigateToProfileScreen(),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.05,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            color: Colors.white),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.12,),
                BigText(text: "Add new address"),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.1, top: MediaQuery.of(context).size.height * 0.02),
              child: SmallText(text: "Full name", size: 16, color: loginPageLabelColor,),
            ),
            Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, top: MediaQuery.of(context).size.height * 0.01),
              child: AppTextField(textController: _fullNameTextController, hintText: "Full name", textInputType: TextInputType.text),
            ),
            Padding(
              padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.1, top: MediaQuery.of(context).size.height * 0.02),
              child: SmallText(text: "Mobile number", size: 16, color: loginPageLabelColor,),
            ),
            Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, top: MediaQuery.of(context).size.height * 0.01),
              child: AppTextField(textController: _mobileNumberTextController, hintText: "Mobile number", textInputType: TextInputType.phone),
            ),
            Padding(
              padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.1, top: MediaQuery.of(context).size.height * 0.02),
              child: SmallText(text: "State", size: 16, color: loginPageLabelColor,),
            ),
            Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, top: MediaQuery.of(context).size.height * 0.01),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
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
                child: TextField(
                  controller: _stateTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.arrow_forward_ios, color: blackColor,),
                    hintStyle:  TextStyle(color: hintTextColor, fontSize: MediaQuery.of(context).size.height/52.75),
                    hintText: "Select State",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: textFieldBorderColor,
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
            ),
            Padding(
              padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.1, top: MediaQuery.of(context).size.height * 0.02),
              child: SmallText(text: "City", size: 16, color: loginPageLabelColor,),
            ),
            Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, top: MediaQuery.of(context).size.height * 0.01),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
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
                child: TextField(
                  controller: _cityTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.arrow_forward_ios, color: blackColor,),
                    hintStyle:  TextStyle(color: hintTextColor, fontSize: MediaQuery.of(context).size.height/52.75),
                    hintText: "Select City",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: textFieldBorderColor,
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
            ),
            Padding(
              padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.1, top: MediaQuery.of(context).size.height * 0.02),
              child: SmallText(text: "Street (Include house number)", size: 16, color: loginPageLabelColor,),
            ),
            Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, top: MediaQuery.of(context).size.height * 0.01),
              child: AppTextField(textController: _streetTextController, hintText: "Street", textInputType: TextInputType.text),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Center(
              child: GestureDetector(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.07,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30))),
                        color: orangeColor),
                    child: BigText(text: "SAVE",size: 20, color: Colors.white,)

                  // Text(
                  //   'LOGIN',
                  //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                  // ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
