import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Stack(
          children: [
            Container(
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/page3.jpg'),
                fit: BoxFit.cover 
                )
            ),
          )
          ]
        ),
      ),
    );
  }
}