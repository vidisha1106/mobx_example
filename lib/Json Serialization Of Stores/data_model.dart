class Post
{

   late int userId;
   late int id;
   late String title;
   late String body;

  Post({required this.userId,required this.id, required this.title,required this.body});

  ///Map to Object
  Post.fromMap(Map<String,dynamic> map) {
    userId = map['userId'];
    id= map['id'];
    title= map['title'];
    body= map['body'];
  }

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