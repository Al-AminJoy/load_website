import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: WillPopScope(
            onWillPop: () => _exitApp(context),
            child: WebView(
              initialUrl: "https://suffixit.com/",
              onWebViewCreated: (WebViewController webViewController) {
                controller = webViewController;
              },
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (String url) async {
                print("Loading Finished");

              },

              onPageStarted: (String url) async {
                print("Loading Start");
              },
            ),
          )
      );
  }


  Future<bool> _exitApp(BuildContext context) async {
    if (await controller.canGoBack()) {
      controller.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

}