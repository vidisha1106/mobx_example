import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data_model.g.dart';
@JsonSerializable()
class DataModel
{

   late String userId;
   late String id;
   late String title;
   late String body;

  DataModel({required this.userId,required this.id, required this.title,required this.body});

  ///Map to Object
   DataModel.fromMap(Map<String,dynamic> map) {
    userId = map['userId'];
    id= map['id'];
    title= map['title'];
    body= map['body'];
  }

  @JsonKey(
    fromJson: DataModel.fromJson(Map<String,dynamic> map) => _$DataFromJson(map)
  )

  ///Using @JsonSerializable()
   factory DataModel.fromJson(Map<String,dynamic> map) => _$DataFromJson(map);

   Map<String,dynamic> toJson() => _$DataToJson(this);

  ///Object To Map
  Map<String,dynamic> toMap()
   {
     return {
       "userId" : userId,
       "id" : id,
       "title" : title,
       "body" : body,
     };
   }
}
