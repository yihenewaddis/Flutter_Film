import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:netflix_flutter/view/Authentication/SignIn.dart';
import 'package:netflix_flutter/view/Authentication/Signup.dart';
import 'package:netflix_flutter/view/On_Boarding/wellcome.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/Home.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/filmdetail.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(
   const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black,
    )
  );
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool is_autenticated = true;
  @override
  Widget build(BuildContext context) {
      if(is_autenticated){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/onboardingScreen',
        getPages: [
          GetPage(name: '/home', page:()=> Home(),transition: Transition.downToUp,transitionDuration:const Duration(milliseconds: 300)),
          GetPage(name: '/onboardingScreen', page: ()=>WellComeScreen()),
          GetPage(name: '/signIn', page: ()=>SignIn(),transition: Transition.downToUp,transitionDuration:const Duration(milliseconds: 400)),
          GetPage(name: '/signUp', page: ()=>signUp(),transition: Transition.rightToLeft),
          GetPage(name: '/detail', page: ()=>filmdetail(),transition: Transition.downToUp,transitionDuration:const Duration(milliseconds: 400)),
          ],
      );}

    else{
      return GetMaterialApp(
        initialRoute: '/onboardingScreen',
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/onboardingScreen', page: ()=>WellComeScreen()),
          GetPage(name: '/signIn', page: ()=>SignIn(),transition: Transition.downToUp,transitionDuration:const Duration(milliseconds: 400)),
          GetPage(name: '/signUp', page: ()=>signUp(),transition: Transition.rightToLeft),
          ],
      );}
  }
}