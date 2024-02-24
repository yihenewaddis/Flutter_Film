import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Spiner extends StatelessWidget {
  const Spiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 50,
                  height: 100,
                  child:const Center(
                    child:  CircularProgressIndicator(
                    color:  Color.fromARGB(255, 241, 143, 7),
                  ),
                  ),
                );
  }
}