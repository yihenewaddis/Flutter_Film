import 'package:flutter/material.dart';
import 'package:netflix_flutter/view/On_Boarding/page1.dart';
import 'package:netflix_flutter/view/On_Boarding/page2.dart';
import 'package:netflix_flutter/view/On_Boarding/page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class WellComeScreen extends StatefulWidget {
  WellComeScreen({super.key});

  @override
  State<WellComeScreen> createState() => _WellComeScreenState();
}

class _WellComeScreenState extends State<WellComeScreen> {
  PageController controller = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index){
              setState(() {
                if(index==2){
                  isLastPage = true;
                }
              });
            },
            children:const [
              Page1(),
              Page2(),
              Page3()
            ],
          ),
          Container(
            alignment: Alignment(0,0.8),
            child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const WormEffect(
                  dotColor: Colors.white,
                  ),
                ), )
        ],
      ),
    );
  }
}