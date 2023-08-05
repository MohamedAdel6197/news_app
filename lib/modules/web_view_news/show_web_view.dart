import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowWebViewItemNews extends StatelessWidget {
  final String url;
  const ShowWebViewItemNews({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}
