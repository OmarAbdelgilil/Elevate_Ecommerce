import 'package:elevate_ecommerce/features/notifications/domain/model/notification_model.dart';

class NotificationDTO {
  String? title;
  String? body;
  String? createdAt;
  String? id;

  NotificationDTO({this.title, this.body, this.createdAt, this.id});

  NotificationModel toNotificationModel() {
    return NotificationModel(
      title: title ?? '',
      body: body ?? '',
      createdAt: createdAt ?? '',
      id: id ?? '',
    );
  }

  factory NotificationDTO.fromJson(Map<String, dynamic> json) {
    return NotificationDTO(
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