import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/notifications/data/DTOs/notificationDTO.dart';
import 'package:elevate_ecommerce/features/notifications/data/dataSource/notification_onlineDataSourse.dart';
import 'package:elevate_ecommerce/features/notifications/domain/model/notification_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:NotificationOnlineDataSourse)
class NotificationOnlinedatasourceimpl implements NotificationOnlineDataSourse {
  final ApiManager apiManager;
  NotificationOnlinedatasourceimpl(this.apiManager);

  @override
 Future<Result<List<NotificationModel>>> getNotifications() {
    return executeApi(
          () async {
        final result = await apiManager.getNotifications();

        final notificationModels = result!.notification.map((notification) {
          return NotificationDTO(
            id: notification.id,
            body: notification.body,
            title: notification.title,
            createdAt: notification.createdAt,
          ).toNotificationModel();
        }).toList();

        return notificationModels;
      },
    );
  }



  @override
  Future<Result<bool?>> removeNotification(String notificationId) {
    return executeApi(
          () async {
        final response = await apiManager.removeNotification(notificationId) ;
        if (response?.message == 'success') {
          return true;
        } else {
          return false;
        }
      },
    );
  }

}