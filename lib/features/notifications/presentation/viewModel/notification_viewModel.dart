import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/notifications/domain/model/notification_model.dart';
import 'package:elevate_ecommerce/features/notifications/domain/usecases/getNotifications_usecase.dart';
import 'package:elevate_ecommerce/features/notifications/domain/usecases/removeNotification_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationViewModel extends Cubit<NotificationState> {
  final GetNotificationsUsecase _getNotificationsUsecase;
  final RemoveNotificationUsecase _removeNotificationUsecase;


  NotificationViewModel(
      this._getNotificationsUsecase,
      this._removeNotificationUsecase,
      )
      : super(NotificationInitialState());

  void doIntent(NotificationIntent intent) {
    switch (intent) {
      case LoadNotificationIntent():
        _getNotifications();
        break;
      case RemoveNotificationIntent():
        _removeNotification(intent.notificationId);
        break;

    }
  }



  Future<void> _getNotifications() async {
    emit(NotificationLoadingState());
    final result = await _getNotificationsUsecase.getNotifications();
    switch (result) {
      case Success<List<NotificationModel>>():
        emit(NotificationSuccessState(notiicationData: result.data));
      case Fail<List<NotificationModel>>():
        emit(NotificationErrorState(exception: result.exception));
    }
  }


  Future<void> _removeNotification(String notificationId) async {
    emit(NotificationRemovedState());
    final result = await _removeNotificationUsecase.removeNotification(notificationId);

    if (result == true) {
      final notification = await _getNotificationsUsecase.getNotifications();
      switch (notification) {
        case Success<List<NotificationModel>>():
          emit(NotificationSuccessState(notiicationData: notification.data));
          break;
        case Fail<List<NotificationModel>>():
          emit(NotificationErrorState(exception: notification.exception));
          break;
      }
    } else {
      emit(NotificationErrorState());
    }
  }



}

sealed class NotificationIntent {}

class LoadNotificationIntent extends NotificationIntent {}

class RemoveNotificationIntent extends NotificationIntent {
  final String notificationId;
  RemoveNotificationIntent(this.notificationId);
}


sealed class NotificationState {}

class NotificationInitialState extends NotificationState {}

class NotificationRemovedState extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationSuccessState extends NotificationState {
  final List<NotificationModel>? notiicationData;
  NotificationSuccessState({this.notiicationData});
}

class NotificationErrorState extends NotificationState {
  final Exception? exception;
  NotificationErrorState({this.exception});
}