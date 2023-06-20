import 'dart:convert';

import 'api_model.dart';
import 'package:http/http.dart' as http;

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
      print("Error while fetching data from Api : $e");
      return [];
    }
  }
}