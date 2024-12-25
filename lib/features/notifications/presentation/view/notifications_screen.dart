import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/extract_error_message.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/features/notifications/presentation/view/notification_item.dart';
import 'package:elevate_ecommerce/features/notifications/presentation/viewModel/notification_viewModel.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:elevate_ecommerce/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationViewModel notificationViewModel = getIt<NotificationViewModel>();

    return BlocProvider(
      create: (context) => notificationViewModel..doIntent(LoadNotificationIntent()),
      child: Scaffold(
        appBar: customAppBar(title: StringsManager.notification.tr()),
        body: BlocBuilder<NotificationViewModel, NotificationState>(
          builder: (context,state){
            if (state is NotificationRemovedState) {

              notificationViewModel.doIntent(LoadNotificationIntent());
              return Center(child: CircularProgressIndicator(color:ColorManager.primary,));
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: state is NotificationLoadingState
                    ? Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                )
                    : state is NotificationErrorState
                    ? Center(
                  child: Text(extractErrorMessage(state.exception)),
                )
                    : state is NotificationSuccessState
                    ? (state.notiicationData!.isEmpty
                    ? Center(
                  child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text(StringsManager.noNotificationsMsg.tr(),style: AppTextStyles.price(color: Colors.black),)),
                      Center(child: Text('🔕',style: AppTextStyles.price(fontSize: 25.sp),)),

                    ],
                  ),
                )
                    : ListView.separated(
                  separatorBuilder:(context, index) =>
                      Padding(
                        padding:  EdgeInsets.only(top: 8.h,bottom: 8.h),
                        child: Container(height: 1.h,color: Colors.grey,),
                      ),
                  itemCount: state.notiicationData!.length,
                  itemBuilder: (context, index) {
                    return NotificationItem(
                      viewModel: notificationViewModel,
                      notification: state.notiicationData![index],
                    );
                  },
                ))
                    : SizedBox(),
              ),
            );
          },


        ),
      ),
    );
  }
}
