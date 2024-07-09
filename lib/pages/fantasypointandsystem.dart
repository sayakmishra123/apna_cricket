import 'package:apna_cricket/colors/mycolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FantasyPointSystem extends StatelessWidget {
  FantasyPointSystem({super.key});
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith(
              'https://apnacricket.dthlms.in/WebPages/FantasyPoint')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(
        Uri.parse('https://apnacricket.dthlms.in/WebPages/FantasyPoint'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          flexibleSpace: Container(
            // height: 100,
            decoration: const BoxDecoration(gradient: MyColors.appbargradient),
          ),
          title: const Text(
            'Fantasy Point System',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        body: WebViewWidget(controller: controller));
  }
}
