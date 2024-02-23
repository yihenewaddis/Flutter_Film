import 'package:flutter/material.dart';

class Horizontal_scroll_button extends StatelessWidget {
   Horizontal_scroll_button({super.key});

  List tab_label =["English","Korean", "japanese","Hindi","French","spanish"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tab_label.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(right: 5,left: 5,top: 2),
            child: TextButton(
              style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(const Color.fromARGB(255, 241, 143, 7)),),

              onPressed: (){}, 
              child: Text('  ${tab_label[index]}  ',style: const TextStyle(
                color:  Colors.white,fontWeight: FontWeight.bold),)),
          );
        }
      )
    );
  }
}