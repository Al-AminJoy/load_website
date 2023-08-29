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

  bool isLoading=true;

  var currentStatus;


  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    log("BACKPRESS INIT");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        children: <Widget>[
          WillPopScope(
            onWillPop: () => _exitApp(context),
            child: WebView(
              initialUrl: "https://suffixit.com/",
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
          ),
          isLoading ? Center(child: CircularProgressIndicator(),)
              : Stack(),
        ],
      ),
    );
  }


  Future<bool> _exitApp(BuildContext context) async {
    if (await controller.canGoBack()) {
      log("BACKPRESS BACK");
      controller.goBack();
      return Future.value(true);
    } else {
      log("BACKPRESS NOt BACK");

      return Future.value(true);

    }
  }


}
