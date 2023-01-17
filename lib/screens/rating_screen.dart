import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/small_text.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  String ratingLabel = "Bad";
  final TextEditingController _reviewTextController = TextEditingController();

  void navigateBack(){
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.38,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                              "https://images.unsplash.com/photo-1579751626657-72bc17010498?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cGl6emF8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60")),
                    ),
                    Positioned(
                      top: 20,
                      left: 15,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap:() => navigateBack(),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.height * 0.05,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  color: Colors.white),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 220,
                      left: 150,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.06,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: MediaQuery.of(context).size.height * 0.05,
                          backgroundImage: NetworkImage(
                              "https://www.freepnglogos.com/uploads/pizza-hut-png-logo/pizza-hut-brands-png-logo-8.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BigText(text: "Pizza Hut"),
              SmallText(
                text: "4102  Pretty View Lanenda",
                size: 13,
                color: loginPageLabelColor,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/dot.png"),
                  SizedBox(
                    width: 5,
                  ),
                  SmallText(
                    text: "Order Delivered",
                    size: 15,
                    color: orangeColor,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              BigText(text: "Please Rate Delivery Service"),
              SizedBox(
                height: 10,
              ),
              BigText(
                text: ratingLabel,
                color: orangeColor,
                size: 22,
              ),
              SizedBox(
                height: 10,
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    if (rating > 1) {
                      ratingLabel = "Okay";
                    }
                    if (rating > 2) {
                      ratingLabel = "Good";
                    } else if (rating > 3) {
                      ratingLabel = "Very good";
                    } else if (rating > 4) {
                      ratingLabel = "Excellent";
                    }
                  });
                  print(rating);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 90.2,
                    right: MediaQuery.of(context).size.height / 90.2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height / 80.27),
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
                  controller: _reviewTextController,
                  maxLines: 6,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: hintTextColor,
                        fontSize: MediaQuery.of(context).size.height / 52.75),
                    hintText: "Write review",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height / 75.27),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: textFieldBorderColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height / 75.27),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: textFieldBorderColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height / 75.27),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),


              GestureDetector(

                child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    // height: MediaQuery.of(context).size.height * 0.06,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        color: orangeColor),
                    child: BigText(text: "SUBMIT",size: 30, color: Colors.white,)

                  // Text(
                  //   'LOGIN',
                  //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                  // ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
