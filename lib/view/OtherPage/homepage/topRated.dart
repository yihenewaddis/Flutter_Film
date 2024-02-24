import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_flutter/controller/fetchFilmData.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/column_movie_list.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/horizontal_premium_list.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/horizontal_scroll_tab.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/next_and_prive_button.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/spiner.dart';

class TopRated extends StatefulWidget {
  const TopRated({super.key});
  
  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  
      Map<dynamic,dynamic> premium_top_rated_film_data = {};
      Map<dynamic,dynamic> top_rated_film_data = {};
      int page = 2;

      List tab_label =["English","Korean", "japanese","Hindi","French","spanish"];

      //create the instance of FeatchFilms for premium films
      final  top_rated_page_film_data = Get.put(FeatchFilms());

            void Change_page(value)async{
        if(value == 'next'){
          setState(() {
          page +=1;
        });
        featch_top_rated_film()
        ;}
        if(value=='prev'){
          setState(() {
          page -=1;
        });
        featch_top_rated_film();
        }
      }


      @override
        void initState() {
          fietch_premium_filmFilm();
          super.initState();
        }

    void fietch_premium_filmFilm()async{
    Map<dynamic,dynamic> data = await top_rated_page_film_data.featchfilmdata('https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1');

    setState(() {
      premium_top_rated_film_data=data;
    });
    featch_top_rated_film();
    }
    void featch_top_rated_film()async{

    Map<dynamic,dynamic> datas = await top_rated_page_film_data.featchfilmdata('https://api.themoviedb.org/3/movie/top_rated?&page=${page}');

    setState(() {   
    top_rated_film_data = datas;
    });

    }
  
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 14, 40),
      body:Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Horizontal_scroll_button(),
                
              premium_top_rated_film_data.isNotEmpty? 
                  (premium_top_rated_film_data.containsKey('error')?
                  const Center(child:  Text('something went wrong try again',style: TextStyle(color: Colors.white),)):
                  Horizontal_premium_list(premium_list:premium_top_rated_film_data['results']))
              :Spiner(),
              
              const SizedBox(height: 20,),
                premium_top_rated_film_data.isNotEmpty?const Padding(
                padding:  EdgeInsets.only(left: 10),
                child:  Text('TopRated  Click to Detail',style: TextStyle(color: Color.fromARGB(255, 241, 143, 7),fontWeight: FontWeight.bold,fontSize: 18),),
                ):const Text(''),


                top_rated_film_data.isNotEmpty? 
                (top_rated_film_data.containsKey('error')?const Text('something went wrong try again'):  column_movie_list(Movie_List:top_rated_film_data['results']))
                :const Spiner(),


                const SizedBox(height: 30,), //Spiner()
                top_rated_film_data.isNotEmpty? next_prive_button(Change_page:Change_page,page: page,):const Text(''),
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