// import 'package:flutter/material.dart';

// var this_year = DateTime.now().year.toString();

// class AppConfig {
//   static String copyright_text = "@ ActiveItZone " + this_year; //this shows in the splash screen
//   static String app_name = "Active eCommerce"; //this shows in the splash screen
//   //enter your purchase code for the app from codecanyon
//   //static String purchase_code = ""; //enter your purchase code for the app from codecanyon

//   //configure this
//   static const bool HTTPS = false;

//   //configure this
//   static const DOMAIN_PATH = "192.168.0.109/ecommerce_demo_three"; //localhost
//   //static const DOMAIN_PATH = "demo.activeitzone.com/ecommerce_flutter_demo"; //inside a folder
//   //static const DOMAIN_PATH = "addtocartbd.com"; // directly inside the public folder

//   //do not configure these below
//   static const String API_ENDPATH = "api/v2";
//   static const String PUBLIC_FOLDER = "public";
//   static const String PROTOCOL = HTTPS ? "https://" : "http://";
//   static const String RAW_BASE_URL = "${PROTOCOL}${DOMAIN_PATH}";
//   static const String BASE_URL = "${RAW_BASE_URL}/${API_ENDPATH}";

//   //configure this if you are using amazon s3 like services
//   //give direct link to file like https://[[bucketname]].s3.ap-southeast-1.amazonaws.com/
//   //otherwise do not change anythink
//   static const String BASE_PATH = "${RAW_BASE_URL}/${PUBLIC_FOLDER}/";
//   //static const String BASE_PATH = "https://tosoviti.s3.ap-southeast-2.amazonaws.com/";
// }



import 'package:flutter/material.dart';

var this_year = DateTime.now().year.toString();

class AppConfig {
  static String copyright_text = "Easy Khareed " + this_year; //this shows in the splash screen
  static String app_name = "Easy Khareed"; //this shows in the splash screen
  static String purchase_code = "233433";

  //configure this
  static const bool HTTPS = true;
 //easykhareeddev.einnovention.tech/api/allProducts
  //configure this
  static const DOMAIN_PATH = "easykhareed.com";
  //static const DOMAIN_PATH = "demo.activeitzone.com/ecommerce_flutter_demo";
  //static const DOMAIN_PATH = "adbuild.ae";

  //do not configure these below
  static const String API_ENDPATH = "api/v2";
  static const String API_ENDPATHH = "api/v1";
  static const String PUBLIC_FOLDER = "public";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "${PROTOCOL}${DOMAIN_PATH}";
  static const String BASE_URL = "${RAW_BASE_URL}/${API_ENDPATH}";

  //configure this if you are using amazon s3 like services
  //give direct link to file like https://[[bucketname]].s3.ap-southeast-1.amazonaws.com/
  //otherwise do not change anythink
  
  static const String BASE_PATH = "${RAW_BASE_URL}/${PUBLIC_FOLDER}/";
}
