import 'package:flutter/material.dart';

class TextFild extends StatefulWidget {

  final IconData sufixIcon;
  bool obscureText = false;
  final String label;
  final void Function(String) setTexts;
  TextFild({required this.sufixIcon,required this.setTexts,required this.obscureText,required this.label,super.key});

  @override
  State<TextFild> createState() => _TextFildState();
}

class _TextFildState extends State<TextFild> {
  @override
  Widget build(BuildContext context) {
    return   TextField(
          style: TextStyle(
            color: Colors.grey[400]),

          obscureText: widget.obscureText,
          onChanged: (value) => widget.setTexts(value),

          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              child: Icon(widget.sufixIcon),
              onTap: () => setState(() {
                widget.obscureText= !widget.obscureText; }),),
                
            suffixIconColor: Colors.white,
            
            enabledBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),

            focusedBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),),

            label: Text(widget.label),
            labelStyle:const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold),

            fillColor:const Color.fromARGB(255, 62, 61, 61),
            filled: true
          ),);}
          }