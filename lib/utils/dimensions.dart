import 'package:flutter_device_type/flutter_device_type.dart';

class Dimensions {
  static double screenHeight = Device.screenHeight;
  static double screenWidth = Device.screenWidth;


  static double pageViewContainer = screenHeight/3.84;
  static double pageViewTextContainer = screenHeight/7.03;
  static double pageView = screenHeight/2.64;

  //dynamic height padding and margin
  static double height10 = screenHeight/84.4;
  static double height08 = screenHeight * 0.01;
  static double height20 = screenHeight/42.2;
  static double height15 = screenHeight/56.27;
  static double height24 = screenHeight * 0.028;
  static double height30 = screenHeight/28.13;
  static double height35 = screenHeight * 0.043;
  static double height45 = screenHeight/18.76;
  static double height50 = screenHeight * 0.06;
  static double height64 = screenHeight * 0.076;
  static double height65 = screenHeight  * 0.168;
  static double height150 = screenHeight  * 0.178;
  static double height167 = screenHeight  * 0.18;


  //dynamic width padding and margin
  static double width10 = screenWidth/84.4;
  static double width20 = screenWidth/42.2;
  static double width15 = screenWidth/56.27;
  static double width30 = screenWidth/28.13;
  static double width35 = screenWidth * 0.043;
  static double width50 = screenWidth * 0.129;
  static double width84 = screenWidth  * 0.217;

  static double font20 = screenHeight/42.2;
  static double font24 = screenHeight * 0.0285;
  static double font26 = screenHeight/32.46;
  static double font16 = screenHeight/52.75;
  static double font18 = screenHeight* 0.021;
  static double font15 = screenHeight * 0.0177;
  static double font12 = screenHeight * 0.0144;
  static double font45 = screenHeight * 0.053;
  static double font31 = screenHeight * 0.034;

  //radius
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;
  static double radius15 = screenHeight/56.27;
  static double radius5 = screenHeight * 0.01;

  //icon size
  static double iconSize24 = screenHeight/35.17;
  static double iconSize16 = screenHeight/52.75;
  static double iconSize38 = screenHeight * 0.045;


//Listview Image size
  static double listViewImageSize = screenWidth /3.25;
  static double listViewTextContainerSize = screenWidth /3.9;

//Popular food
  static double popularFoodImgSize = screenHeight / 2.41;


  static double bottomHeightBar = screenHeight / 7.03;



}
