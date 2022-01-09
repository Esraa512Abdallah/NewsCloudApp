import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
class Article {

 final String? title ;
 final String?  description ;
 final String? imageurl ;
 final String? url ;

  Article( { required this.title, required this.description , required this.url , required this.imageurl });

  factory Article.fromJson(Map<String , dynamic>? jsonData){

    return Article(
        title  : jsonData!["title"],
        description :  jsonData["description"],
        imageurl : jsonData["urlToImage"],
        url : jsonData["url"],
    );

  }
}

class NewsModel {
  final List<Article>? Articles  ;
  
  NewsModel ({ required this.Articles});
  
  factory NewsModel.fromJson(Map<String? , dynamic>? jsonData){
    return NewsModel(
      Articles: (jsonData!["articles"] as List ).map((e) => Article.fromJson(e)).toList(),
    );

  }
  
}
