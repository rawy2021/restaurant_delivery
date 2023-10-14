// ignore_for_file: file_names

import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; //800
  static double screenWidth = Get.context!.width; //375

  //container height
  static double pageView = screenHeight / 2.5; //800/320 = 2.5
  static double pageViewContainer = screenHeight / 3.64; //  800/220=3.64
  static double pageViewTextContainer = screenHeight / 6.66;
  //container width
  static double pageViewWidth = screenHeight / 1.13; //360/320 = 2.5
  static double pageViewContainerWidth = screenHeight / 1.63; //  360/220=3.64
  static double pageViewTextContainerWidth =
      screenHeight / 3; // 360/120 = 6.66;
  //dynamic height padding and margin
  static double height5 = screenHeight / 160.0; //800/10 = 80.0
  static double height10 = screenHeight / 80.0; //800/10 = 80.0
  static double height15 = screenHeight / 53.3; //800/15 = 53.3
  static double height20 = screenHeight / 40.0; //800/20 = 40.0
  static double height25 = screenHeight / 32.0; //800/20 = 40.0
  static double height30 = screenHeight / 26.7;
  static double height40 = screenHeight / 20.0;
  //dynamic width  padding and margin
  static double width2 = screenWidth / 180.0; //360/20 = 72.0
  static double width5 = screenWidth / 72.0; //360/20 = 72.0
  static double width10 = screenWidth / 36.0;
  static double width20 = screenWidth / 18.0;
  static double width30 = screenWidth / 12.0;
  static double width35 = screenWidth / 10.7;
  //radios
  static double radios10 = screenWidth / 80.0; //800/20 = 80.0
  static double radios20 = screenWidth / 40.0; //800/20 = 40.0
  static double radios30 = screenWidth / 26.7; //800/20 = 40.0
  //fonts
  static double font10 = screenHeight / 80.0; //800/10 = 80.0
  static double font12 = screenHeight / 66.6; //800/10 = 66.6
  static double font15 = screenHeight / 53.3; //800/10 = 53.3
  static double font18 = screenHeight / 44.4;
  static double font20 = screenHeight / 40.0;
  static double font30 = screenHeight / 26.6;
  // icon size
  static double iconSize16 = screenHeight / 50.0;
  static double iconSize20 = screenHeight / 36.8;
  static double iconSize26 = screenHeight / 30.8;
  static double iconSize30 = screenHeight / 26.6;
  static double iconSize40 = screenHeight / 20.0;
  //List view Size
  static double listViewImageSize = screenWidth / 4.30;
  static double listViewTextContSize = screenWidth / 3.6;
  //Food_Popular
  static double popularFoodImgSize = screenHeight / 2.29;
  //Bottum Height Bar
  static double buttonHeightBar = screenHeight / 6.67;
}
