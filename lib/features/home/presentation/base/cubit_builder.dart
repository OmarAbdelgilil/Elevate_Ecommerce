// base_builder.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../utils/assets_manager.dart';
import '../../../../utils/color_manager.dart';
import 'base_states.dart';
import 'base_widgets.dart';

Widget baseBuilder(BuildContext context, BaseState state, Widget child) {
  if (state is LoadingState) {
    return Center(
      child: const SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(strokeWidth: 2,color: ColorManager.primary, )),
    );
  } else if (state is SuccessState) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Fluttertoast.showToast(
          msg: state.message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.black,
          fontSize: 16.0,


      );
    });
  } else if (state is EmptyState) {
    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildAnimatedImage(LottieAssets.noContent, false),
      BaseWidgets.buildMessage(
        context,
        state.message ?? StringsManager.emptyContent.tr(),
        ColorManager.black,
      ),
      BaseWidgets.buildButton(
        displayType: state.displayType,
        context: context,
        onTap: state.retry,
        title: StringsManager.retryAgain.tr(),
      ),
    ]);
  } else if (state is ErrorState) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Fluttertoast.showToast(
        msg: state.errorMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,


      );
    });
  }

  return child;
}
