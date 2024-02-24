import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_flutter/controller/fetchFilmData.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/column_movie_list.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/horizontal_premium_list.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/horizontal_scroll_tab.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/next_and_prive_button.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/spiner.dart';
class NowPlaying extends StatefulWidget {
  NowPlaying({super.key});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
      Map<dynamic,dynamic> premium_film_data = {};
      Map<dynamic,dynamic> NowPlaying_film_data = {};
      int page = 2;
      List tab_label =["English","Korean", "japanese","Hindi","French","spanish"];



      //create the instance of FeatchFilms for premium films
      final  now_playing_page_film_Data = Get.put(FeatchFilms());
      void Change_page(value)async{
        if(value == 'next'){
          setState(() {
          page +=1;
        });
        featch_now_playing_film()
        ;}
        if(value=='prev'){
          setState(() {
          page -=1;
        });
        featch_now_playing_film();
        }
      }
      @override
        void initState() {
          fietch_premium_Film();
          super.initState();
        }
    void fietch_premium_Film()async{
    Map<dynamic,dynamic> data = await now_playing_page_film_Data.featchfilmdata('https://api.themoviedb.org/3/movie/now_playing?&page=1');
    setState(() {
    premium_film_data=data;
    });
    featch_now_playing_film();
    NowPlaying_film_data = {};
    }

    void featch_now_playing_film()async{

    Map<dynamic,dynamic> datas = await now_playing_page_film_Data.featchfilmdata('https://api.themoviedb.org/3/movie/now_playing?&page=${page}');

    setState(() {   
    NowPlaying_film_data = datas;
    });
    now_playing_page_film_Data.pageChange();
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor:const Color.fromARGB(255, 20, 14, 40),
      body:Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Horizontal_scroll_button(),
                
                premium_film_data.isNotEmpty? 
                (premium_film_data.containsKey('error')?const Text('something went wrong try again'):Horizontal_premium_list(premium_list:premium_film_data['results']))
                :const Spiner(),

                const SizedBox(height: 20,),

                premium_film_data.isNotEmpty?const Padding(
                  padding:  EdgeInsets.only(left: 10),
                  child:  Text('Now playing movie  Click to Detail',style: TextStyle(color: Color.fromARGB(255, 241, 143, 7),fontWeight: FontWeight.bold,fontSize: 18),),
                ):const Text(''),
                
                NowPlaying_film_data.isNotEmpty? 
                (premium_film_data.containsKey('error')?const Text('something went wrong try again'):  column_movie_list(Movie_List:NowPlaying_film_data['results']))
                :const Spiner(),

                const SizedBox(height: 30,), //Spiner()
                NowPlaying_film_data.isNotEmpty? next_prive_button(Change_page:Change_page,page: page,):const Text(''),
                const SizedBox(height: 40,), 
              ],
            ),
          )
        ],
      )
    ),
  );
  }
}