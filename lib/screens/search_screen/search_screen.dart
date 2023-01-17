import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodoma_app/screens/filter_screen/filter_screen.dart';
import 'package:foodoma_app/utils/colors.dart';
import 'package:foodoma_app/widgets/back_button.dart';
import 'package:foodoma_app/widgets/big_text.dart';
import 'package:foodoma_app/widgets/conatiner_with_image.dart';
import 'package:foodoma_app/widgets/small_text.dart';
import 'package:foodoma_app/widgets/text_field_with_icon.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchFoodScreen extends StatefulWidget {
  const SearchFoodScreen({Key? key}) : super(key: key);

  @override
  _SearchFoodScreenState createState() => _SearchFoodScreenState();
}

class _SearchFoodScreenState extends State<SearchFoodScreen> {
  final TextEditingController _searchTextField = TextEditingController();

  List<String> searchList = ["Asian noodle salad", "Dominos Pizza",  "Burgers", "Burgers"];
  List<String> dishNames = [
    "Fast food",
    "Breakfast",
    "Aisa",
    "Mexican",
    "Pizza",
    "Donat"
  ];

  List<String> imageUrl = [
    "assets/burger.png",
    "assets/breakfast.png",
    "assets/aisain.png",
    "assets/mexican_filter.png",
    "assets/pizza_filter.png",
    "assets/donut_filter.png"
  ];
  int pressedAttentionIndex = -1;


  late List<bool> pressedAttentions = dishNames.map((e) => false).toList();


  void navigateToFilterScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const FilterScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,

        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: CustomBackButton()),
            ),
            BigText(text: "Search Food"),
            Padding(
                padding: const EdgeInsets.all(20.0),
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

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [

              //
              IconAppTextField(
                textController: _searchTextField,
                icon: Icons.search_outlined,
                hintText: "Find for food or restaurant...",
              ),
              // Expanded(child: Container()),
              SizedBox(width: 4,),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: GestureDetector(
                    onTap: () {
                      navigateToFilterScreen();
                      setState(() {});
                      // return navigateToCategoryPage();
                    },
                    child: ImageContainer(
                      imageName: "assets/filter_button.png",
                      width: 48.w,
                      height: 48.h, themeValue: 0,
                      // isPressed: gridPressed,
                    )),
              ),
            ],
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8),
          child: BigText(text: "Recent searches", size: 18.sp,),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: searchList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Icon(Icons.access_time_rounded, color: loginPageLabelColor,size: 19,),
                        SizedBox(width: 10.w,),
                        SmallText(text: searchList[index], color: blackColor,size: 15.sp,),

                      ],
                    ),
                  );
            }),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16.0,top: 8),
            child: BigText(text: "Cuisines", size: 18.sp,),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.builder(
              padding: EdgeInsets.zero,
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
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
                  ),
                );
              },
            ),
          ),







        ],),
    );
  }
}
