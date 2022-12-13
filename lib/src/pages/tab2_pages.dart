import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Tab2Page extends StatefulWidget {
  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Tab2Page> {
  bool isLoading = true;
  final _key = UniqueKey();

  late WebViewController _controller;

  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    //showLoader(context);

    return SafeArea(
      child: Stack(children: [
        WillPopScope(
          onWillPop: () => _goBack(context),
          child: WebView(
            onWebResourceError: (error) {
              print(error.description);
            },
            key: _key,
            userAgent:
                'Mozilla/5.0 (iPhone; CPU iPhone OS 8_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12D508',
            //backgroundColor: Colors.grey[200],
            //initialUrl: 'https://www.kachopoking.es/tienda',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controllerCompleter.future.then((value) => _controller = value);
              // _controllerCompleter.complete(webViewController);
              _controllerCompleter.complete(webViewController);
              webViewController.loadUrl(
                'https://www.kachopoking.es/tienda',
                headers: {
                  "sec-ch-ua":
                      '"Microsoft Edge";v="107", "Chromium";v="107", "Not=A?Brand";v="24"'
                },
              );
            },
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
        ),
        isLoading
            ? const Center(
                //child: SpinKitRotatingCircle(color: Colors.blueAccent)
                child: CircularProgressIndicator(),
              )
            : Stack(),
      ]),
    );
  }

  Future<bool> _goBack(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Deseas salir de la app ?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text('Si'),
                  ),
                ],
              ));
      return Future.value(true);
    }
  }

  Widget showLoader(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.red,
          duration: Duration(milliseconds: 50000),
        ),
      ),
    );
  }
}
