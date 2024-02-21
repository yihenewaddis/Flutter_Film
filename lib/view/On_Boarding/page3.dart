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
                image: AssetImage('lib/assets/bela.jpg'),
                fit: BoxFit.cover 
                )
            ),
          ),
          Positioned(
            right: 6,
            top: 4,
            child: Text('Yihenew M',
            style: TextStyle(
                      color: Colors.red[600],
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      ),),
          ),
          Positioned(
            bottom: 120,
            right: 2,
            left: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5,0,5,0),
              child: Column(
                children: [
                  Text('Enjoy it',style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    
                    
                  ),),
                  Text('See Your Movie And Tv Series Just Frome Home With Out Going Outside ',style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),)
                ]),
            ),
          )
          ]
        ),
      ),
    );
  }
}