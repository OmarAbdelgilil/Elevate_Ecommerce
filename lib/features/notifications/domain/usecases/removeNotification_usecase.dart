import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/notifications/domain/repository/notification_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveNotificationUsecase {
  final NotificationRepository _notificationRepository;
  RemoveNotificationUsecase(this._notificationRepository);
  Future<Result<bool?>> removeNotification( String notificationId) async {
    return await _notificationRepository.removeNotification(notificationId);
  }
}