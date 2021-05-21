import 'package:flutter/material.dart';
import 'package:iap/main_page.dart';
import 'log_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Iap_start(),
      title: "IAP",
    );
  }
}


