import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/drawer.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SafeArea(child: 
      Scaffold(
      key: _scaffoldKey,

      drawer:const Drawer(
        backgroundColor: Color.fromARGB(255, 16, 13, 24),
        child: Drawers()),

      appBar: AppBar(
        title:const Text('Y.A MOVIE',style: TextStyle(color: Color.fromARGB(255, 237, 165, 49)),),
        backgroundColor:const Color.fromARGB(255, 17, 10, 38),
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 237, 165, 49),
            size: 30,),

          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),

        actions: [
          Padding(
            padding:const EdgeInsets.only(right: 15),
            child: GestureDetector(child:const Icon(Icons.search,color: Color.fromARGB(255, 237, 165, 49),size: 30,)),
          )],),

        body: ListView(
          children: [
            
          ],
          
        ))
      ),
    );
  }
}