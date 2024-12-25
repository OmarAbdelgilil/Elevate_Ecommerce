import 'package:elevate_ecommerce/features/notifications/domain/model/notification_model.dart';
import 'package:elevate_ecommerce/features/notifications/presentation/viewModel/notification_viewModel.dart';
import 'package:elevate_ecommerce/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class NotificationItem extends StatelessWidget {
  NotificationModel notification;
  NotificationViewModel viewModel;
  NotificationItem(
      {super.key, required this.notification, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.notifications_active_outlined,
          size: 25,
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                style: AppTextStyles.title(
                    fontSize: 19.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                notification.body,
                style: AppTextStyles.subtitle(
                    fontSize: 16.sp, fontWeight: FontWeight.w500),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        InkWell(
            onTap: () {
              viewModel.doIntent(RemoveNotificationIntent(notification.id));
            },
            child: Icon(
              Icons.delete,
              size: 25,
              color: Colors.red,
            )),
      ],
    );
  }
}
