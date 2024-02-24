import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_flutter/controller/fetchFilmData.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/column_movie_list.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/horizontal_premium_list.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/horizontal_scroll_tab.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/next_and_prive_button.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/spiner.dart';

class Popular extends StatefulWidget {
  Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {

      Map<dynamic,dynamic> premium_popular_film_data = {};
      Map<dynamic,dynamic> popular_film_data = {};
      int page = 2;

      List tab_label =["English","Korean", "japanese","Hindi","French","spanish"];

      //create the instance of FeatchFilms for premium films
      final  popular_page_film_data = Get.put(FeatchFilms());

            void Change_page(value)async{
        if(value == 'next'){
          setState(() {
          page +=1;
        });
        featch_popular_film()
        ;}
        if(value=='prev'){
          setState(() {
          page -=1;
        });
        featch_popular_film();
        }
      }


      @override
        void initState() {
          fietch_premium_filmFilm();
          super.initState();
        }

    void fietch_premium_filmFilm()async{
    Map<dynamic,dynamic> data = await popular_page_film_data.featchfilmdata('https://api.themoviedb.org/3/movie/popular?language=en-US&page=1');

    setState(() {
      premium_popular_film_data=data;
    });
    featch_popular_film();
    }
    void featch_popular_film()async{

    Map<dynamic,dynamic> datas = await popular_page_film_data.featchfilmdata('https://api.themoviedb.org/3/movie/popular?&page=${page}');

    setState(() {   
    popular_film_data = datas;
    });

    }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 14, 40),
      body:Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Horizontal_scroll_button(),
                
              premium_popular_film_data.isNotEmpty? 
                  (premium_popular_film_data.containsKey('error')?
                  const Center(child:  Text('something went wrong try again',style: TextStyle(color: Colors.white),)):
                  Horizontal_premium_list(premium_list:premium_popular_film_data['results']))
              :const Spiner(),
              
                const SizedBox(height: 20,),
                  premium_popular_film_data.isNotEmpty?const Padding(
                  padding:  EdgeInsets.only(left: 10),
                  child:  Text('Popular movie  Click to Detail',style: TextStyle(color: Color.fromARGB(255, 241, 143, 7),fontWeight: FontWeight.bold,fontSize: 18),),
                ):const Text(''),

                popular_film_data.isNotEmpty? 
                (popular_film_data.containsKey('error')?const Text('something went wrong try again'):  column_movie_list(Movie_List:popular_film_data['results']))
                :const Spiner(),


                const SizedBox(height: 30,), //Spiner()
                popular_film_data.isNotEmpty? next_prive_button(Change_page:Change_page,page: page,):const Text(''),
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