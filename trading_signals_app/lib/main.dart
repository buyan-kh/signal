// lib/main.dart
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'history_page.dart';
import 'subscription_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading Signals App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/history': (context) => HistoryPage(),
        '/subscription': (context) => SubscriptionPage(),
      },
    );
  }
}