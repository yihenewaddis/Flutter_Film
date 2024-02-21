import 'package:flutter/material.dart';

class DontHaveAcount extends StatelessWidget {
  const DontHaveAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          GestureDetector(
            child:const Text('Dont have an acount : sign up',
            style: TextStyle(
              color: Colors.white
            ),
            ))
        ],
      );}}