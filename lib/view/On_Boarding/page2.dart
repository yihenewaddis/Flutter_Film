import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/page2.jpg'),
                fit: BoxFit.cover 
                )
            ),
          ),
          ]
        ),
      ),
    );
  }
}