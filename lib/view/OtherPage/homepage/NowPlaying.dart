import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_flutter/controller/fetchFilmData.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/horizontal_premium_list.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/horizontal_scroll_tab.dart';
class NowPlaying extends StatefulWidget {
  NowPlaying({super.key});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
      Map<dynamic,dynamic> finalfeatcheddata = {};
      Map<dynamic,dynamic> premium_film_data = {};
      String language = 'am';
      List tab_label =["English","Korean", "japanese","Hindi","French","spanish"];

      //create the instance of FeatchFilms for premium films
      final  featchePremiumdData = Get.put(FeatchFilms());
      // final FeatchFilms featchedPopularData = Get.put(FeatchFilms('https://api.themoviedb.org/3/movie/upcoming?&page=1'));

      @override
        void initState() {
          fietchFilm();
          super.initState();
        }
    void fietchFilm()async{
    Map<dynamic,dynamic> data = await featchePremiumdData.featchfilmdata('https://api.themoviedb.org/3/movie/now_playing?&page=1');
    // Map<dynamic,dynamic> datas = await featchedPopularData.featchfilmdata(language);
    setState(() {
      premium_film_data=data;
    });
    // print(data);
    // print('breaking point');
    // print(datas);
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 14, 40),
      body:Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Horizontal_scroll_button(),
                
                premium_film_data.isNotEmpty? 
                (premium_film_data.containsKey('error')?Text('something went wrong try again'):Horizontal_premium_list(premium_list:premium_film_data['results']))

                :Container(
                  width: 50,
                  height: 100,
                  child:const Center(
                    child:  CircularProgressIndicator(
                    color:  Color.fromARGB(255, 241, 143, 7),
                  ),
                  ),
                ),

              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  ],
                )
              ],
            ),
          )
        ],
      )
    ),
  );
  }
}