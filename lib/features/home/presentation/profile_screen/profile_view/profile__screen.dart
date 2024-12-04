import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/api_constants.dart';
import 'package:elevate_ecommerce/core/providers/user_provider.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:elevate_ecommerce/utils/text_style.dart';
import 'package:elevate_ecommerce/utils/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/assets_manager.dart';
import '../profile_view_model/profile_view_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = getIt<UserProvider>();

    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, profileViewModel, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p10, vertical: AppPadding.p10),
            child: Column(
              children: [
                SizedBox(height: AppSize.s40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      SVGAssets.homeScreenLogo,
                      width: 90.w,
                      height: 26.h,
                    ),
                    SvgPicture.asset(
                      SVGAssets.notificationIcon,
                      width: 90.w,
                      height: 26.h,
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        userProvider.userData?.photo == ApiConstants.profileImageDefault
                            ? Navigator.pushNamed(context, AppRoutes.editProfile)
                            : null;
                      },
                      child: Center(
                        child: SizedBox(
                          width: 85.w,
                          height: 85.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl: _getValidImageUrl(userProvider.userData?.photo ?? ''),
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  Center(
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                      color: ColorManager.white,
                                      strokeWidth: AppSize.s1,
                                      strokeCap: StrokeCap.round,
                                    ),
                                  ),
                              errorWidget: (context, url, error) => Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorManager.grey)),
                                child: const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.s10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userProvider.userData?.firstName ?? StringsManager.guest,
                          style: AppTextStyles.title(),
                        ),
                        SizedBox(width: AppSize.s8.w),
                        SvgPicture.asset(SVGAssets.penIcon),
                      ],
                    ),
                    Text(
                      userProvider.userData?.email ?? StringsManager.guestEmail,
                      style: AppTextStyles.title(
                        color: ColorManager.lightGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.s40.h),
                _profileSection(
                    SvgPicture.asset(
                      SVGAssets.transactionIcon,
                      width: 25.w,
                      height: 25.h,
                    ),
                    StringsManager.myOrder,
                        () {},
                    null),
                _profileSection(
                    SvgPicture.asset(
                      SVGAssets.locationIcon,
                      width: 25.w,
                      height: 25.h,
                    ),
                    StringsManager.savedAddress,
                        () {},
                    null),
                const Divider(color: ColorManager.grey),
                _profileSection(
                  Switch(
                    value: profileViewModel.isNotificationEnabled,
                    onChanged: (value) => profileViewModel.toggleNotification(value),
                    activeColor: ColorManager.primary,
                    inactiveThumbColor: Colors.grey.shade400,
                    inactiveTrackColor: Colors.grey.shade300,
                  ),
                  StringsManager.notification,
                      () {},
                  null,
                ),
                SizedBox(height: AppSize.s15.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      SVGAssets.languageIcon,
                      width: 25.w,
                      height: 25.h,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      StringsManager.language,
                      style: AppTextStyles.title(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => _showLanguageModal(context, profileViewModel),
                      child: Text(
                        profileViewModel.selectedLanguage,
                        style: AppTextStyles.title(
                            color: ColorManager.primary,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.s10.h),
                _profileSection(
                    null, StringsManager.conditions, () {}, null),
                _profileSection(
                    null, StringsManager.aboutUs, () {}, null),
                const Divider(color: ColorManager.grey),
                _profileSection(
                  SvgPicture.asset(
                    SVGAssets.logoutIcon,
                    width: 25.w,
                    height: 25.h,
                  ),
                  StringsManager.logout,
                      () {},
                  SvgPicture.asset(
                    SVGAssets.logoutIcon,
                    width: 40.w,
                    height: 45.h,
                    colorFilter: const ColorFilter.mode(ColorManager.grey, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getValidImageUrl(String? photo) {
    if (photo == null || photo.isEmpty || photo == ApiConstants.profileImageDefault) {
      return 'https://via.placeholder.com/150';
    }
    return photo;
  }
}


  Widget _profileSection(
      Widget? icon, String sectionName, void Function()? onPressed, Widget? logOut) {
    return Row(
      children: [
        icon ?? const SizedBox(width: 0),
        const SizedBox(width: 5),
        Text(
          sectionName,
          style: AppTextStyles.title(fontWeight: FontWeight.w400, fontSize: 15),
        ),
        const Spacer(),
        logOut != null
            ? const SizedBox.shrink()
            : IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
        GestureDetector(
            onTap: onPressed,
            child: logOut ?? const SizedBox(width: 0)),
      ],



    );
  }

  void _showLanguageModal(BuildContext context, ProfileViewModel profileViewModel) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Text
              Text(
                StringsManager.selectedLanguage,
                style: AppTextStyles.title(fontSize: 18),
              ),
              const SizedBox(height: AppSize.s20),
              _buildLanguageOption(context, StringsManager.english, () {
                profileViewModel.setLanguage(StringsManager.english);
                Navigator.pop(context);
              }),
              _buildLanguageOption(context, StringsManager.arabic, () {
                profileViewModel.setLanguage(StringsManager.arabic);
                Navigator.pop(context);
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(BuildContext context, String languageName, Function? onTap) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent.withOpacity(0.1),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.language,
              color: Colors.blue,
              size: 25,
            ),
            const SizedBox(width: 15),
            Text(
              languageName,
              style: AppTextStyles.subtitle(fontSize: 16),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

