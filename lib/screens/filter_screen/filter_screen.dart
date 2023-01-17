import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterSceenState createState() => _FilterSceenState();
}

class _FilterSceenState extends State<FilterScreen> {
  List<String> dishNames = [
    "Fast food",
    "Breakfast",
    "Aisa",
    "Mexican",
    "Pizza",
    "Donat"
  ];
  List<String> shortBy = [
    "Popular",
    "Free Delivery",
    "Near me",
    "Cost low to high",
    "Delivery time"
  ];
  List<String> imageUrl = [
    "assets/burger.png",
    "assets/breakfast.png",
    "assets/aisain.png",
    "assets/mexican_filter.png",
    "assets/pizza_filter.png",
    "assets/donut_filter.png"
  ];
  List<String> rating = ["1", "2", "3", "4", "5"];
  List<String> reversedRating = [];
  late List<bool> pressedAttentions = dishNames.map((e) => false).toList();

  int pressedAttentionIndex = -1;
  int shortByAttentionIndex = -1;
  int ratingAttentionIndex = -1;
  DateTime selectedDate = DateTime.now();
  RangeValues values = RangeValues(0, 500);

  @override
  void initState() {
    // TODO: implement initState
    reversedRating = rating.reversed.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: CustomBackButton(),
                ),
                SizedBox(
                  width: 98.w,
                ),
                BigText(
                  text: "Filters",
                  size: 18.sp,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BigText(
                text: "Cuisines",
                size: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: dishNames.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 45),
                itemBuilder: (_, index) {
                  final pressAttention = pressedAttentionIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        pressedAttentionIndex = index;
                      });
                    },
                    child: Container(
                        // width: 122.w,
                        // height: MediaQuery.of(context).size.height * 0.01,
                        // alignment: Alignment.center,
                        // padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                              blurRadius: 3,
                              spreadRadius: pressAttention ? 4 : 1,
                              offset:
                                  pressAttention ? Offset(4, 10) : Offset(1, 4),
                              color: pressAttention
                                  ? orangeColor.withOpacity(0.2)
                                  : Colors.grey.withOpacity(0.6),
                            )
                          ],
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: pressAttention
                                      ? orangeColor
                                      : Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.r))),
                          color: pressAttention ? orangeColor : Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Container(
                                width: 31.w,
                                height: 31.h,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.r),
                                    child: Image.asset(
                                      imageUrl[index],
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Text(
                                dishNames[index],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style:GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  color: pressAttention ? Colors.white : blackColor,
                                    fontWeight: FontWeight.w500
                                ),
                              )
                            )
                          ],
                        )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BigText(
                text: "Short by",
                size: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: shortBy.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 45),
                itemBuilder: (_, index) {
                  final shortByPressAttention = shortByAttentionIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        shortByAttentionIndex = index;
                      });
                    },
                    child: Container(
                        // width: 122.w,
                        // height: MediaQuery.of(context).size.height * 0.01,
                        // alignment: Alignment.center,
                        // padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                              blurRadius: 3,
                              spreadRadius: shortByPressAttention ? 4 : 1,
                              offset: shortByPressAttention
                                  ? Offset(4, 10)
                                  : Offset(1, 4),
                              color: shortByPressAttention
                                  ? orangeColor.withOpacity(0.2)
                                  : Colors.grey.withOpacity(0.6),
                            )
                          ],
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: shortByPressAttention
                                      ? orangeColor
                                      : Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.r))),
                          color: shortByPressAttention
                              ? orangeColor
                              : Colors.white,
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: BigText(
                              text: shortBy[index],
                              size: 13.sp,
                              color: shortByPressAttention
                                  ? Colors.white
                                  : blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BigText(
                text: "Rating",
                size: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: rating.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 45),
                itemBuilder: (_, index) {
                  final ratingPressAttention = ratingAttentionIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        ratingAttentionIndex = index;
                      });
                    },
                    child: Container(
                        // width: 122.w,
                        // height: MediaQuery.of(context).size.height * 0.01,
                        // alignment: Alignment.center,
                        // padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                              blurRadius: 3,
                              spreadRadius: ratingPressAttention ? 4 : 1,
                              offset: ratingPressAttention
                                  ? Offset(4, 10)
                                  : Offset(1, 4),
                              color: ratingPressAttention
                                  ? orangeColor.withOpacity(0.2)
                                  : Colors.grey.withOpacity(0.6),
                            )
                          ],
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: ratingPressAttention
                                      ? orangeColor
                                      : Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.r))),
                          color:
                              ratingPressAttention ? orangeColor : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: BigText(
                                text: reversedRating[index],
                                size: 13.sp,
                                color: ratingPressAttention
                                    ? Colors.white
                                    : blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Icon(
                                Icons.star,
                                size: 12,
                                color: ratingPressAttention
                                    ? Colors.white
                                    : starColor,
                              ),
                            ),
                          ],
                        )),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: BigText(
                    text: "Price range",
                    size: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: BigText(
                    text: "€5 - €500",
                    size: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            RangeSlider(
                values: values,
                max: 500,
                min: 0,
                activeColor: orangeColor,
                inactiveColor: rangeBarColor,
                onChanged: (values) {
                  setState(() {
                    this.values = values;
                    print(values);
                  });
                }),

            SizedBox(height: 71.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: GestureDetector(
                      child: Container(
                          width: 153.w,
                          height: 60.h,
                          // height: MediaQuery.of(context).size.height * 0.06,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              border: Border.all(color: orangeColor),
                              color: Colors.white),
                          child: BigText(
                            text: "Reset",
                            size: 15.sp,
                            color: orangeColor,
                          )

                          // Text(
                          //   'LOGIN',
                          //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                          // ),
                          ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      child: Container(
                          width: 153.w,
                          height: 60.h,
                          // height: MediaQuery.of(context).size.height * 0.06,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.r))),
                              color: orangeColor),
                          child: BigText(
                            text: "LOGIN",
                            size: 15.sp,
                            color: Colors.white,
                          )

                          // Text(
                          //   'LOGIN',
                          //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                          // ),
                          ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
