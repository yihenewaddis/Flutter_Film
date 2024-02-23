import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/NowPlaying.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/drawer.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/popular.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/topRated.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/upComing.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//buttom navbar page list
  List<Widget> ButtomNavBarPage = [
    NowPlaying(),
    Popular(),
    TopRated(),
    UpComing(),
  ];   

  int ButtomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: 
      Scaffold(
      key: _scaffoldKey,

      drawer:const Drawer(
        backgroundColor: Color.fromARGB(255, 16, 13, 24),
        child: Drawers()),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ButtomNavBarIndex,
        onTap: (value) => setState(() {
          ButtomNavBarIndex = value;
        }),
        backgroundColor:const Color.fromARGB(255, 17, 10, 38),
        selectedItemColor:const Color.fromARGB(255, 237, 165, 49),
        selectedLabelStyle:const TextStyle(fontSize:12),
        unselectedLabelStyle:const TextStyle(fontSize: 12) ,
        unselectedItemColor: Colors.white,
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        items:const [
        BottomNavigationBarItem(icon: Icon(Icons.play_arrow),label: 'Now Playing'),
        BottomNavigationBarItem(icon: Icon(Icons.high_quality),label: 'Popular'),
        BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Top Rated'),
        BottomNavigationBarItem(icon: Icon(Icons.time_to_leave),label: 'Upcoming'),
        ]),


      appBar: AppBar(
        title:const Text('Y.A MOVIE',style: TextStyle(color: Color.fromARGB(255, 237, 165, 49),fontSize: 16),),
        backgroundColor:const Color.fromARGB(255, 17, 10, 38),
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 237, 165, 49),
            size: 30,),
            onPressed: () { _scaffoldKey.currentState?.openDrawer();},),

        actions: [
          Padding(
            padding:const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const Icon(
                Icons.search,color: Color.fromARGB(255, 237, 165, 49),size: 30,),
                onPressed: () { _scaffoldKey.currentState?.openDrawer();},),
              )],),

        body:  ButtomNavBarPage[ButtomNavBarIndex],)
      ),
    );
  }
}