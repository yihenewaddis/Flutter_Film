import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                }else{
                  isLastPage = false; 
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
            alignment: Alignment(0,0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: (){
                    controller.previousPage(duration: const Duration(milliseconds: 700), curve: Curves.bounceOut);
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 248, 119, 6))),
                  child:const  Text('  Previous  ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                  ),

                SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                      dotColor: Colors.white,
                      activeDotColor: Color.fromARGB(255, 248, 119, 6)
                      ),
                    ),
                
                if (!isLastPage)
                TextButton(
                  onPressed: (){
                    controller.nextPage(duration: const Duration(milliseconds: 400),curve: Curves.linear);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 248, 119, 6))
                  ), 
                  child: const Text('   Next   ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                  ),

                  if(isLastPage)
                TextButton(
                  onPressed: (){
                    Get.toNamed('/signIn');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 248, 119, 6))
                  ), 
                  child: const Text('   Done   ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                  ),
              ],
            ), )
        ],
      ),
    );
  }
}