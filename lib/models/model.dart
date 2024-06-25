class Model1 {
  String userId;
  String id;
  String title;
  String body;

  Model1({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Model1.fromJson(Map<String, dynamic> json) {
    return Model1(
      userId: json['userId'].toString(),
      id: json['id'].toString(),
      title: json['title'],
      body: json['body'],
    );
  }

  // Convert model to JSON structure for storing data
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  // ini untuk update
  void updateFromJson(Map<String, dynamic> json) {
    userId = json['userId'].toString();
    id = json['id'].toString();
    title = json['title'] as String;
    body = json['body'] as String;
  }
}
