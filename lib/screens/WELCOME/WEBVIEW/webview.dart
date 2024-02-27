import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inkozi/widgets/CustomAppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  String url;
  String title;

  WebView({super.key, required this.title, required this.url});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  WebViewController? controller;
  void loadWEbview() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.inkozi.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void initState() {
    loadWEbview();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff84008c),
    ));
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          action: SizedBox(),
        ),
        body: Container(
          height: height,
          width: width,
          child: controller == null
              ? Center(
                  child: CircularProgressIndicator(
                  color: Color(0xff84008c),
                ))
              : WebViewWidget(controller: controller!),
        ),
      ),
    );
  }
}
