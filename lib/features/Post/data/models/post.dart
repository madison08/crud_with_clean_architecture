class Post {
  int? id;
  int? created_at;
  String title;
  String body;

  Post({this.id, this.created_at, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"],
      created_at: json["created_at"],
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
