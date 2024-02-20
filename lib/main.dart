import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_flutter/view/On_Boarding/wellcome.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/Home.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool is_autenticated = false;
  @override
  Widget build(BuildContext context) {
      if(is_autenticated){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        getPages: [
          GetPage(name: '/home', page:()=> Home()),
          ],
      );}

    else{
      return GetMaterialApp(
        initialRoute: '/onboardingScreen',
        debugShowCheckedModeBanner: false,
        getPages: [GetPage(name: '/onboardingScreen', page: ()=>WellComeScreen())],
      );}
  }
}