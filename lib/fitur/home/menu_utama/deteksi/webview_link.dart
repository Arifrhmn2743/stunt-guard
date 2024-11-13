import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewLink extends StatefulWidget {
  const WebviewLink({super.key});

  @override
  State<WebviewLink> createState() => _WebviewLinkState();
}

class _WebviewLinkState extends State<WebviewLink> {
  final Uri _url = Uri.parse(
      'https://drive.google.com/file/d/1_wSrusDI7UKbWqQTxoCVj2_7sYfZcDr-/view?usp=sharing');
  late final WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(_url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: _controller),
    );
  }
}
