import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Post
{
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId,required this.id, required this.title,required this.body});

  factory Post.fromJson(Map<String,dynamic> json) => Post(
    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    body: json['body'],
  );

  Map<String,dynamic> toJson() => {
    'userId' : userId,
    'id' : id,
    'title' : title,
    'body' : body,
  };
}

class PostApi
{
  Future<List<Post>> getDataFromApi() async
  {
    final url=Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try{
      final response=await http.get(url);
      if(response.statusCode==200)
        {
          final data=jsonDecode(response.body) as List;
          return data.map((e) => Post.fromJson(e),).toList();
        }
      else
        {
          print("failed to fetch data from Api");
          return [];
        }
    }
    catch(e)
    {
      print("Error while fetching data from Api");
      return [];
    }
  }
}