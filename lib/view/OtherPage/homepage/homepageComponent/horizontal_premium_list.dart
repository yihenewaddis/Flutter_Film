import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Horizontal_premium_list extends StatelessWidget {
  
  final List premium_list;
  Horizontal_premium_list({required this.premium_list,super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 272,
      
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: premium_list.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(right: 10,left: 5,top: 20),
            child: Container(
              height: 270,
              width: 180,
              decoration: BoxDecoration(
                color:const Color.fromARGB(255, 20, 32, 74),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                children: [
                  Stack(
                    children: [

                    SizedBox(
                      width: 175,
                      height: 140,
                      child:  ClipRRect(
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                          'https://image.tmdb.org/t/p/original/${premium_list[index].containsKey('backdrop_path')?premium_list[index]['backdrop_path']:premium_list[index]['poster_path']}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        decoration:const BoxDecoration(
                          color:  Color.fromARGB(255, 241, 143, 7),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10))
                        ),
                        width: 70,
                        height: 25,
                        child:const Padding(
                          padding:  EdgeInsets.all(3.0),
                          child: Text('premium',style:TextStyle(color: Colors.white),),
                        ),
                      )),
                    ],
                  ),
                  Column(
                    children: [
                    Text(premium_list[index]['original_title'],overflow: TextOverflow.ellipsis,
    maxLines: 1,style:const TextStyle(color: Color.fromARGB(255, 241, 143, 7)),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        const Column(
                          children: [
                            Text('released_date -',style: TextStyle(color: Colors.white),),
                            Text('vote_count -',style:  TextStyle(color: Colors.white),)
                          ],
                          ),
                          Column(
                          children: [
                            Text(premium_list[index]['release_date'],style:const TextStyle(color: Colors.white),),
                            Text(premium_list[index]['vote_count'].toString(),style: const TextStyle(color: Colors.white),)
                          ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      TextButton(
                        style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 241, 143, 7)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0), 
                          ),
                        ),
                        ),
                        onPressed: (){
                        Get.bottomSheet(                          
                        Container(
                              height: 50.0, 
                              width: double.infinity,
                              child:const Center(
                                child: Text('Unavailable'),
                              ),
                            )
                        );
                        }, 
                        child:const Padding(
                          padding:  EdgeInsets.only(left: 35,right: 35),
                          child:  Text('P L A Y',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                        ))
                    ],
                  )
                ],
              ),
            ),
          );
        }
      )
    );
  }
}