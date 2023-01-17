import 'package:flutter/material.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/category_screen_food_container.dart';
import 'package:foodoma_app/widgets/conatiner_with_image.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> name = ["Chicken Hawaiian", "Chicken", "Biryani", "Qorma"];
  List<String> details = [
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple",
    "Chicken, Cheese and pineapple"
  ];
  List<String> price = ["3.45", "4.45", "5.45", "6.45"];
  List<String> rating = ["4.5", "4.4", "5.4", "1.4"];
  List<String> imageUril = [
    "https://images.unsplash.com/photo-1475090169767-40ed8d18f67d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1539136788836-5699e78bfc75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGZvb2R8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
  ];
  List<String> reviewCount = ["25", "25", "25", "25"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "assets/category_header.png",
                        width: MediaQuery.of(context).size.height * 0.3,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const CustomBackButton())),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BigText(
                            text: "Fast",
                            size: MediaQuery.of(context).size.height * 0.067,
                          ),
                          BigText(
                            text: "Food",
                            size: MediaQuery.of(context).size.height  * 0.098,
                            color: orangeColor,
                          ),
                          // SizedBox(
                          //   height: 2
                          // ),
                          SmallText(
                            text: "80 type of pizza",
                            size: MediaQuery.of(context).size.height/52.75,
                            color: loginPageLabelColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 20),
                child: Row(
                  children: [
                    SmallText(
                      text: "Short by:",
                      color: blackColor,
                      size: MediaQuery.of(context).size.height * 0.0177,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height/56.27,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 22.0),
                      child: Row(
                        children: [
                          SmallText(
                            text: "Popular",
                            size: MediaQuery.of(context).size.height * 0.0177,
                            color: orangeColor,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: MediaQuery.of(context).size.height * 0.03,
                            color: orangeColor,
                          ),
                          SizedBox(
                            width: 140.w,
                          ),
                          Padding(
                            padding:
                                 EdgeInsets.only(left: MediaQuery.of(context).size.width/56.27, right: MediaQuery.of(context).size.width/84.4),
                            child: GestureDetector(
                                child: ImageContainer(
                              imageName: "assets/filter_button.png",
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.height * 0.05, themeValue: 0,
                            )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: name.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              // onTap: () => navigateToFoodDetail(),
                              child: CategoryScreenFoodContainer(
                            name: name[index],
                            details: details[index],
                            rating: rating[index],
                            imageUrl: imageUril[index],
                            price: price[index],
                            reviewsCount: reviewCount[index],
                          )),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
