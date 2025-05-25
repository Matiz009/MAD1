class PostsModel {
  int userId;
  int id;
  String title;
  String body;

  PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Factory constructor to create an instance from JSON
  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }
}
