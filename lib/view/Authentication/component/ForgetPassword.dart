import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              child: Text('Forgot password ?',
              style: TextStyle(
                color: Colors.red[500],
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
          ); }}