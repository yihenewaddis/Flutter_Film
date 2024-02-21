import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DontHaveAcount extends StatelessWidget {
  
   DontHaveAcount({super.key});
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          GestureDetector(
            onTap: (){Get.toNamed('/signUp');},
            child:const Text("Don't have an acount : sign up know",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
            )),
            
        ],
      );}}