import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  late WebViewController controller;

  bool isLoading=true;

  var currentStatus;


  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    super.initState();
  }


  String hexString = "002C5F";
  //var hexColor = Color(int.parse("0x002C5F}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF002c5f),
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        toolbarHeight: 0,
      ),
      body: Stack(
        children: <Widget>[
          WillPopScope(
            onWillPop: () => _exitApp(context),
            child: WebView(
              initialUrl: "https://www.hyundai.com/worldwide/en/vehicles",
              onWebViewCreated: (WebViewController webViewController) {
                controller = webViewController;
              },
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
          ),
          isLoading ? Center(child: CircularProgressIndicator(color:Color(0xFF002c5f) ,),)
              : Stack(),
        ],
      ),
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
