import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/notifications/data/dataSource/notification_onlineDataSourse.dart';
import 'package:elevate_ecommerce/features/notifications/domain/model/notification_model.dart';
import 'package:elevate_ecommerce/features/notifications/domain/repository/notification_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NotificationRepository)
class NotificationRepositoryimpl implements NotificationRepository {
  final NotificationOnlineDataSourse _notificationOnlineDatasource;

  NotificationRepositoryimpl(this._notificationOnlineDatasource);

  @override
  Future<Result<List<NotificationModel>>> getNotifications()async {
    return await _notificationOnlineDatasource.getNotifications();
  }

  @override
  Future<Result<bool?>>removeNotification(String notificationId) async{
    return await _notificationOnlineDatasource.removeNotification(notificationId);
  }

}