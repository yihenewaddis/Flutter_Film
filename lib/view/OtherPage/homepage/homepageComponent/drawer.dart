import 'package:flutter/material.dart';

class Drawers extends StatelessWidget {
const  Drawers({super.key});


  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Expanded(
            flex: 2,
            child:  Container(
              width: double.infinity,
              child: Padding(
                padding:const  EdgeInsets.only(top: 15),
                child:  Column(
                  children: [
                    
                    const  CircleAvatar(
                      backgroundImage:NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                      radius: 35,
                    ),

                    const SizedBox(height: 5,),
                    const Text('yihenew addis',
                    style: TextStyle(color: Color.fromARGB(255, 237, 165, 49),fontWeight:FontWeight.bold),),
        
                    Text('@yihenew.com',
                    style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.bold),
                    )]
                  ),
                ),
              )
            ),


          const Divider(height: 1,color: Color.fromARGB(255, 10, 40, 117),indent: 2,),
          const SizedBox(height: 20,),

          Expanded(
            flex: 7,
            child: Column(
              children: [

                TextButton(
                onPressed:(){} , 
                child:const Padding(
                  padding:  EdgeInsets.only(top: 10, bottom: 10),
                  child:  Row(
                    children: [
                      Icon(Icons.watch_later,size: 30,color: Color.fromARGB(255, 237, 165, 49),),
                      SizedBox(width: 20,),
                      Text('Watch later',
                      style: TextStyle(color:Color.fromARGB(255, 237, 165, 49),),
                      )
                    ],
                  ),
                )),


                TextButton(
                onPressed:(){} , 
                child:const Padding(
                  padding:  EdgeInsets.only(top: 10,bottom: 10),
                  child:  Row(
                    children: [
                      Icon(Icons.person,size: 30,color: Color.fromARGB(255, 237, 165, 49),),
                      SizedBox(width: 20,),
                      Text('Developer',
                      style: TextStyle(color: Color.fromARGB(255, 237, 165, 49),),
                      )
                    ],
                  ),
                )),


                TextButton(
                onPressed:(){} , 
                child:const Padding(
                  padding:  EdgeInsets.only(top: 10,bottom: 10),
                  child:  Row(
                    children: [
                      Icon(Icons.feedback,size: 30,color: Color.fromARGB(255, 237, 165,49),),
                      SizedBox(width: 20,),
                      Text('Feedback',
                      style: TextStyle(color: Color.fromARGB(255, 237, 165, 49),),)
                    ],
                  ),
                )),


                TextButton(
                onPressed:(){} , 
                child:const Padding(
                  padding:  EdgeInsets.only(top: 10,bottom: 10),
                  child:  Row(
                    children: [
                      Icon(Icons.share,size: 30,color: Color.fromARGB(255, 237, 165, 49),),
                      SizedBox(width: 20,),
                      Text('Share',
                      style: TextStyle(color: Color.fromARGB(255, 237, 165, 49),),)
                    ],
                  ),
                )),
              ],
            )),


          const Divider(height: 1,color: Color.fromARGB(255, 10, 40, 117),indent: 2,),
          const SizedBox(height: 15,),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  children: [
                  TextButton(
                  onPressed:(){} , 
                  child:const Row(
                  children: [
                    Icon(Icons.logout,size: 30,color: Color.fromARGB(255, 237, 165, 49),),
                    SizedBox(width: 15,),
                    Text('Log Out',
                    style: TextStyle(color: Color.fromARGB(255, 237, 165, 49),),
                    )
                  ],
                )),
              ],
            )],)
          )


        ],
      ),
    );
  }
}