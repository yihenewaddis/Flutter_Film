import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({super.key});

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
          onPressed: (){},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),),
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 248, 119, 6),),),

          child:const Padding(
            padding:  EdgeInsets.all(15.0),
            child:  Text('     LOG IN      ',style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
          ),); }}