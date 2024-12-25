class NotificationModel {
  final String title;
  final String body;
  final String createdAt;
  final String id;

  NotificationModel({
    required this.title,
    required this.body,
    required this.createdAt,
    required this.id,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      body: json['body'],
      createdAt: json['createdAt'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'createdAt': createdAt,
      '_id': id,
    };
  }
}