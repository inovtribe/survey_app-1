import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUsFragment extends StatefulWidget {
  @override
  _AboutUsFragmentState createState() => _AboutUsFragmentState();
}

class _AboutUsFragmentState extends State<AboutUsFragment> {

  bool isLoadingPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoadingPage = true;
  }

  @override
  Widget build(BuildContext context) {
    return loadWebPage();
  }

  loadWebPage(){
    return Stack(
      children: <Widget>[
        WebView(
          initialUrl: "https://www.satvix.com/",
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish){
            setState(() {
              isLoadingPage = false;
            });
          },
        ),
        isLoadingPage?Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
          ),
        ): Container()
      ],
    );
  }

}


