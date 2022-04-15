class Post {
  String? id;
  String title;
  String body;

  Post({this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "body": body,
    };
  }
}
