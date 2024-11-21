
class ImageAssets {
  static const String imagePath = "assets/images/";



}



class SVGAssets {
  SVGAssets._();

  static const String _basePath = "assets/svg/";


  static const String homeTab = "${_basePath}home_tab.svg";
  static const String cardTab = "${_basePath}card_tab.svg";
  static const String categoryTab = "${_basePath}category_tab.svg";
  static const String personTab = "${_basePath}person_tab.svg";

}

class LottieAssets {
  LottieAssets._();

  static const String _basePath = "assets/lotties/";

  static const String success = "${_basePath}success.json";
  static const String loading = "${_basePath}loading.json";
  static const String error = "${_basePath}error.json";
  static const String call = "${_basePath}viber.json";
  static const String underConstruction = "${_basePath}under_construction.json";
  static const String noContent = "${_basePath}no_content.json";
  static const String noPermissions = "${_basePath}no_permissions.json";
  static const String verificationPending =
      "${_basePath}verification_pending.json";
}