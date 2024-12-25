import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/notifications/domain/model/notification_model.dart';

abstract class NotificationRepository{

  Future<Result<List<NotificationModel>>> getNotifications();

  Future<Result<bool?>> removeNotification(String notificationId);
}