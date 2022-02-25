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

   bool isLoading=true;
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
      child: Stack(
        children: [
          WillPopScope(
          onWillPop: () => _goBack(context),
          child: WebView(
            key: _key,
            backgroundColor: Colors.grey[200],
            initialUrl: 'https://www.kachopoking.es/wp-login.php',
            javascriptMode: JavascriptMode.unrestricted,
            


            onWebViewCreated: (WebViewController webViewController) {
              _controllerCompleter.future.then((value) => _controller = value);
             // _controllerCompleter.complete(webViewController);
            },

            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            ),
          ),
          isLoading ? 
          const Center( 
            //child: SpinKitRotatingCircle(color: Colors.blueAccent)
            child: CircularProgressIndicator()
            ,)
          : Stack(),
          
        
        ]
      ),
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
        child: SpinKitRotatingCircle(color: Colors.red, duration: Duration(milliseconds: 50000),),
      ),
    );





  }
}