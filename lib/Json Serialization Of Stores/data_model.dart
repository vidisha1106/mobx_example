import 'package:json_annotation/json_annotation.dart';
part 'data_model.g.dart';
@JsonSerializable()
class DataModel
{

  // @JsonKey(name: "userId")
   late String userId;

  // @JsonKey(name: "id")
   late String id;

  // @JsonKey(name: "title")
   late String title;

  // @JsonKey(name: "body")
   late String body;

  DataModel({required this.userId,required this.id, required this.title,required this.body});

  ///Map to Object
   DataModel.fromMap(Map<String,dynamic> map) {
    userId = map['userId'];
    id= map['id'];
    title= map['title'];
    body= map['body'];
  }

/*  @JsonKey(
    fromJson: DataModel.fromJson(Map<String,dynamic> map) => _$DataFromJson(map)
  )*/

  ///Using @JsonSerializable()
   factory DataModel.fromJson(Map<String,dynamic> map) => _$DataModelFromJson(map);
   Map<String,dynamic> toJson() => _$DataModelToJson(this);

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
