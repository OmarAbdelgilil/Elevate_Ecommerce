// base_builder.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';

import '../../../../utils/assets_manager.dart';
import '../../../../utils/color_manager.dart';
import 'base_states.dart';
import 'base_widgets.dart';

Widget baseBuilder(BuildContext context, BaseState state, Widget child) {
  if (state is LoadingState) {
    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildAnimatedImage(LottieAssets.loading),
    ]);
  } else if (state is SuccessState) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage)),
      );
    });
  }

  return child;
}
