import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/services.dart' show rootBundle;

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.aboutUs.tr()),
      ),
      body: FutureBuilder<String>(
        future: _loadHtmlFromAssets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Html(
                data: snapshot.data,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<String> _loadHtmlFromAssets() async {
    final filePath = 'about_us_file'.tr();
    return await rootBundle.loadString(filePath);
  }
}
