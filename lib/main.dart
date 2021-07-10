import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final  _controller=Completer<WebViewController>();

  void _goBack(WebViewController webViewController) async {
    final canGoBack=await webViewController.canGoBack();
    if(canGoBack){
      webViewController.goBack();
    }
  }

  void _goForward(WebViewController webViewController)async{
    final canGoForward=await webViewController.canGoForward();
    if(canGoForward){
      webViewController.goForward();
    }
  }

  Widget navigationButton(IconData icon,Function(WebViewController?data) onPressed){
    return FutureBuilder (
      future: _controller.future,
      builder: (context,AsyncSnapshot<WebViewController> snapshot){
        if(snapshot.hasData){
          return IconButton(
              onPressed: ()=> onPressed(snapshot.data),
              icon: Icon(
                icon,
                color:
                Colors.white,));
        }else{
          return Container(
            height: 1,
          );
        }

      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Al-Amin Islam Joy'),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).accentColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonBar(
              children: [
                navigationButton(Icons.chevron_left, (controller) =>_goBack(controller!)),
                navigationButton(Icons.chevron_right, (controller) =>_goForward(controller!)),
              ],
            ),
          ),
        ),
        body: WebView(
          initialUrl: "https://alaminjoy.wordpress.com/",
          onWebViewCreated: (controller)=> _controller.complete(controller),
        ),
      ),
    );
  }
}
