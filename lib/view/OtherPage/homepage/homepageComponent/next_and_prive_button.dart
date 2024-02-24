import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class next_prive_button extends StatelessWidget {

  final Function Change_page;
  int page = 1;
  next_prive_button({required this.Change_page,required this.page,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        
        page>1?TextButton(
          onPressed: (){
            Change_page('prev');
          },

          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0),),),
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 248, 119, 6),)
          ),

          child:const Text('  P R E V  ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)):const Text('        '),

        Text(page.toString(),style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),

        page<10?TextButton(
          onPressed: (){
            Change_page('next');
          },

          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0),),),
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 248, 119, 6),)
          ),
          child:const Text('  N E X T  ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)):const Text('       ')
      
      ],
    );
  }
}