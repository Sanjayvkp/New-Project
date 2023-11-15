import 'dart:convert';

List<PostModel> postModelFromJson(String str) {
  return List<PostModel>.from(
    json.decode(str).map(
          (element) => PostModel.fromMap(element),
        ),
  );
}

class PostModel {
  int userId;
  int id;
  String title;
  String body;
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}


//modelclass2


List<PostModel2> postModel2FromJson(String str) {
  return List<PostModel2>.from(
      json.decode(str).map((e) => PostModel2.fromMap(e)));
}

class PostModel2 {
  int userId;
  int id;
  String title;
  String body;
  PostModel2(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory PostModel2.fromMap(Map<String, dynamic> json) => PostModel2(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}


