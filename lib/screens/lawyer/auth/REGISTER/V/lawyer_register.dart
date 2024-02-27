import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inkozi/widgets/CustomAppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RegisterLawyer extends StatefulWidget {
  static const String routeName = '/registerlawyer';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => RegisterLawyer(),
    );
  }

  RegisterLawyer({super.key});

  @override
  State<RegisterLawyer> createState() => _RegisterLawyerState();
}

class _RegisterLawyerState extends State<RegisterLawyer> {
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
      ..loadRequest(
          Uri.parse('https://www.inkozi.com/advisors/register-step-2'));
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
