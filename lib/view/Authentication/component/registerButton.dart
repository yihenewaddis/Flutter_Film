import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  

 final void Function() logIn;
 final String buttonText;
  RegisterButton({required this.logIn,required this.buttonText,super.key});

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
          onPressed: (){
            widget.logIn();
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),),
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 248, 119, 6),),),

          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:  Text(   widget.buttonText     ,style:const TextStyle(
              color:  Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
          ),); }}