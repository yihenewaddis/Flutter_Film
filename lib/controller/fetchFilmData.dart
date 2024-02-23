import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class FeatchFilms extends GetxController{

Future featchfilmdata(String url) async{

  //to make loading screen

  //initialize the variable to store featched response
  http.Response response;

  //change the normal url in to url object
  var urls = Uri.parse(url);
  
  var headers = {
      'Authorization': ' Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMTFkNGJjNzM4YjIyYWY0YjIxMTc2Yzc2NzQ0ZjQwZSIsInN1YiI6IjY0NjlkM2Q4ZDE4NTcyMDE2MTkxZjIyNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0DangGEKgVV_wr6GP4aRPP55xtPyy0DlElDz0o9DOQw',
      'accept': 'application/json'};

    //get the data from the database
    response = await http.get(urls,headers:headers);

    if(response.statusCode == 200){
      var  decodedResponse = convert.jsonDecode(response.body);
      return decodedResponse;
    }
    else{
      return {"error":"some thing went wrong please try again"};
    }    
  }
}