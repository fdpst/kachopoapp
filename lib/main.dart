import 'package:flutter/material.dart';

import 'src/pages/tabs_pages.dart';
import 'src/themes/tema.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void init() async {
    final status = await AppTrackingTransparency.requestTrackingAuthorization();
  }

  @override
  Widget build(BuildContext context) {
    init();
    return MaterialApp(
      title: 'Material App',
      theme: miTema,
      debugShowCheckedModeBanner: false,
      home: TabsPage(),
    );
  }
}
