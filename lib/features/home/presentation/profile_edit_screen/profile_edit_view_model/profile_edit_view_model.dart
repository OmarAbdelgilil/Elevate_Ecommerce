import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/providers/user_provider.dart';
import '../../../../auth/forget_password/data/models/requests/update_user_data_requeset.dart';

import '../../../../auth/logged_user_data/data/models/user_response/user_response.dart';
import '../../../domain/usecase/update_user_data_usecase.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';



@injectable
class EditProfileScreenViewModel extends BaseCubit {
  final UpdateUserDataUseCase _updateUserDataUseCase;

  static EditProfileScreenViewModel get(BuildContext context) =>
      BlocProvider.of<EditProfileScreenViewModel>(context);

  EditProfileScreenViewModel(this._updateUserDataUseCase);

  @override
  void start() {}

  Future<void> updateUserData(UpdateProfileRequest request) async {
    emit(LoadingState());

    final result = await _updateUserDataUseCase.getUpdateUserData(request);

    if (result is Success<UserResponse?>) {
      emit(SuccessState(result.data?.message ?? ''));

      final updatedUserData = result.data;
      if (updatedUserData != null) {
        final userProvider = getIt<UserProvider>();
        userProvider.updateUserData(updatedUserData.toJson());
      }
    } else if (result is Fail<User?>) {
      emit(ErrorState(result.toString()));
    }
  }
}