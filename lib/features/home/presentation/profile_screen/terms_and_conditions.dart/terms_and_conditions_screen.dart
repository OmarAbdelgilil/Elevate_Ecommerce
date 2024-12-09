import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/services.dart' show rootBundle;

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms and Conditions"),
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
    return await rootBundle.loadString('assets/html/terms_and_conditions.html');
  }
}
