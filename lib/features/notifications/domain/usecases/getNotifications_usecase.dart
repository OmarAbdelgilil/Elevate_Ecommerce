import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/notifications/domain/model/notification_model.dart';
import 'package:elevate_ecommerce/features/notifications/domain/repository/notification_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetNotificationsUsecase {
  final NotificationRepository _notificationRepository;
  GetNotificationsUsecase(this._notificationRepository);

  Future<Result<List<NotificationModel>>>getNotifications() async {
    return await _notificationRepository.getNotifications();
  }
}