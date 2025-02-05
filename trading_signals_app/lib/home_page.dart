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
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
          IconButton(
            icon: Icon(Icons.subscriptions),
            onPressed: () {
              Navigator.pushNamed(context, '/subscription');
            },
          ),
        ],
      ),
      body: signal == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latest Signal',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${signal!['pair']}',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Type: ${signal!['type']}'),
                              Text('RRR: ${signal!['rrr']}'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Current: ${signal!['currentPrice']}'),
                              Text('TP: ${signal!['tpPrice']}', style: TextStyle(color: Colors.green)),
                              Text('SL: ${signal!['slPrice']}', style: TextStyle(color: Colors.red)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text('Date: ${signal!['date']}'),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Open setup link
                              },
                              child: Text('View Setup', style: TextStyle(color: Colors.blue)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}