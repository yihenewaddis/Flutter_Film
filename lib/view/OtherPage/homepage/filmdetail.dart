import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_flutter/controller/fetchFilmData.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/column_movie_list.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/similar_recomended_button.dart';
import 'package:netflix_flutter/view/OtherPage/homepage/homepageComponent/spiner.dart';

class filmdetail extends StatefulWidget {
  filmdetail({super.key});

  @override
  State<filmdetail> createState() => _filmdetailState();
}

class _filmdetailState extends State<filmdetail> {
  final  film_detail_data = Get.put(FeatchFilms());
  Map<dynamic,dynamic> similar_or_recomended_films = {};

  String similar_or_recomended = 'similar';

  void change_similar_or_recomended(value){
    setState(() {
      similar_or_recomended = value;
    });
    featch_Similar_recomended();
  }

  @override
  void initState() {
    super.initState();
    featch_Similar_recomended();
  }

  void featch_Similar_recomended()async{
  
    Map<dynamic,dynamic> data = await film_detail_data.featchfilmdata('https://api.themoviedb.org/3/movie/${Get.arguments['id']}/${similar_or_recomended}?language=en-US&page=1');

    setState(() {
      similar_or_recomended_films = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final imageHeight = deviceHeight * 0.5;

    return  Scaffold(
      backgroundColor:  const Color.fromARGB(255, 20, 14, 40),
      body:Stack(
            children: [
              Image.network('https://image.tmdb.org/t/p/original/${Get.arguments['backdrop_path']!=''?Get.arguments['backdrop_path']:Get.arguments['poster_path']}',
              width: double.infinity,
              height: imageHeight-20,
              fit: BoxFit.cover,
              ),
              ListView(
                  children: [
                    const SizedBox(height: 300,),
                    Container(
                      decoration:const BoxDecoration(
                        color:   Color.fromARGB(255, 20, 14, 40),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(15,10,15,10),
                            child: Text(Get.arguments['original_title'],style:const TextStyle(color: Color.fromARGB(255, 241, 143, 7),fontSize: 22,fontWeight: FontWeight.bold),),
                          ),

                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15,5,15,10),
                            child: Text(Get.arguments['overview'],style: TextStyle(color: Colors.grey[400],fontSize: 16),),
                          ),

                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15,5,15,10),
                            child: Text('it released at ${Get.arguments['release_date']}',style: TextStyle(color: Colors.grey[400],fontSize: 16),),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(15,5,15,10),
                            child: Text('its have ${Get.arguments['vote_average'].toString()} vote avarage',style: TextStyle(color: Colors.grey[400],fontSize: 16),),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(15,5,15,10),
                            child: Text('it have ${Get.arguments['vote_count'].toString()} vote count',style: TextStyle(color: Colors.grey[400],fontSize: 16),),
                          ),
                          const SizedBox(height: 30,),

                          const similar_recommended_button(),
                          const SizedBox(height: 30,),
                          similar_or_recomended_films.isNotEmpty? 
                          (similar_or_recomended_films.containsKey('error')?const Text('something went wrong try again'):  column_movie_list(Movie_List:similar_or_recomended_films['results']))
                          :const Spiner(),
                          ],
                        ),
                    )
                  ],
                ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(30,30,0,0),
              child: GestureDetector(
                onTap: () => Get.back(),
                child:Container(
                  decoration:const BoxDecoration(
                    color: Colors.white
                  ),
                  child: const Icon(Icons.keyboard_return,size: 30,weight: 100,color: Color.fromARGB(255, 243, 128, 5),)),),
            ),
              
            ],
          ),
        
    );
  }
}