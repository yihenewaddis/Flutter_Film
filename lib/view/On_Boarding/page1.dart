import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
            decoration:const BoxDecoration(
              image: DecorationImage(
              image: AssetImage('lib/assets/page1.jpg'),
                fit: BoxFit.cover 
                )
            ),
          ),
        const Positioned(
            right: 6,
            top: 4,
            child: Text('Yihenew M',
            style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      ),),
          )
          ]
        ),
      ),
    );
  }
}