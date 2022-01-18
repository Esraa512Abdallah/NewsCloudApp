
import 'dart:convert';
import 'package:cloudnewsapp/models/news_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

import '../helper/constans.dart';

class NewsViewModel extends GetxController{

  FetchApiData(String category)async{

    final translator = GoogleTranslator();


    final  url = Uri.parse("https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$ApiKey") ;
    http.Response response = await http.get(url);



    if(response.statusCode == 200){


      try {
        final translator = GoogleTranslator();
        var  trans1;
        var  trans2;
        var Dt;

         var Data = jsonDecode(response.body);
        var ArticlesList = NewsModel.fromJson(Data);

        Dt=ArticlesList;



        Dt .Articles!.forEach((el) async{
          trans1 = await  translator.translate(el.title!,from: 'ar', to: 'en'  );
        });

        return ArticlesList ;

      }catch(ex){


        Get.snackbar("Can not  get Data.. ", ex.toString(),padding: EdgeInsets.all(10),
            colorText: Colors.black,backgroundColor: Colors.orangeAccent[300],);

        print("exception is....$ex");

      }

    }

  }


}