// lib/home_page.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? signal;

  @override
  void initState() {
    super.initState();
    fetchSignal();
  }

  Future<void> fetchSignal() async {
    final response = await http.get(Uri.parse('http://localhost:3000/api/signals'));

    if (response.statusCode == 200) {
      setState(() {
        signal = json.decode(response.body)[0];
      });
    } else {
      throw Exception('Failed to load signal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signal'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
            child: Text('History', style: TextStyle(color: Colors.green)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/subscription');
            },
            child: Text('Subscription', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
      body: signal == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Last Update Date: ${signal!['date']}'),
                  Text('${signal!['pair']}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('${signal!['type']} at ${signal!['currentPrice']}'),
                  Text('TP: ${signal!['tpPrice']}', style: TextStyle(color: Colors.green)),
                  Text('SL: ${signal!['slPrice']}', style: TextStyle(color: Colors.red)),
                  Text('1 : ${signal!['rrr']} RRR'),
                  TextButton(
                    onPressed: () {
                      // Open setup link
                    },
                    child: Text('setup link', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
    );
  }
}