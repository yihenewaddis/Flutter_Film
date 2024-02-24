import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class column_movie_list extends StatelessWidget {
  final List Movie_List ;
  const column_movie_list({required this.Movie_List,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children:Movie_List.map((movie) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                    child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration:const BoxDecoration(
                      color: Color.fromARGB(255, 7, 37, 83),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                        
                        },
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                              borderRadius:const BorderRadius.all(Radius.circular(10)),
                              child: Image.network('https://image.tmdb.org/t/p/original/${movie.containsKey('backdrop_path')?movie['backdrop_path']:movie['poster_path']}',
                              fit: BoxFit.cover,
                              width: double.infinity, // Adjust the width of the image
                              height: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                              return const Text('Failed to load image',style: TextStyle(color: Colors.white),);},
                              ),
                              ),
                            ),
                            
                            const SizedBox(width: 15,),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text(movie['original_title'],style:const TextStyle(color: Color.fromARGB(255, 241, 143, 7),fontSize: 18,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),maxLines: 1,),
                        
                                Text(movie['overview'],style: TextStyle(color: Colors.grey[300],overflow: TextOverflow.ellipsis),maxLines: 3,),
                        
                                Text('vote_average    ${movie['vote_average']}',style: const TextStyle(color: Color.fromARGB(255, 241, 143, 7)),),
                        
                                Text('vote_count    ${movie['vote_average']}',style:const TextStyle(color: Color.fromARGB(255, 241, 143, 7)),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ),
                  )).toList(),
                );
  }
}