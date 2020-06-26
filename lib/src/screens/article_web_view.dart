import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  // This widget is responsible to display web view of an article

  final String url;
  final String title;

  const ArticleWebView({Key key, this.url, this.title}) : super(key: key);

  @override
  _ArticleWebViewState createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//            appBar: AppBar(
//            // Here we take the value from the MyHomePage object that was created by
//            // the App.build method, and use it to set our appbar title.
//            title: Text(widget.title),
//      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      )
    );

  }
}
