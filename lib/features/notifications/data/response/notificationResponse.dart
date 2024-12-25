import 'package:elevate_ecommerce/features/notifications/domain/model/notification_model.dart';

class NotificationResponse {
  final String message;
  final List<NotificationModel> notification;

  NotificationResponse({
    required this.message,
    required this.notification,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      message: json['message'] ?? '',
      notification: json['notifications'] != null
          ? (json['notifications'] as List)
          .map((notification) => NotificationModel.fromJson(notification))
          .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'notification': notification.map((notification) => notification.toJson()).toList(),
    };
  }
}
