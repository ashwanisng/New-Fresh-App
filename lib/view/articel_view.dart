import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticelView extends StatefulWidget {
  ArticelView({this.urlImage});
  final String urlImage;

  @override
  _ArticelViewState createState() => _ArticelViewState();
}

class _ArticelViewState extends State<ArticelView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "News",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                "Fresh",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          actions: [
            Opacity(
              opacity: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(Icons.share),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            initialUrl: widget.urlImage,
            onWebViewCreated: ((WebViewController webViewController) {
              _completer.complete(webViewController);
            }),
          ),
        ));
  }
}
