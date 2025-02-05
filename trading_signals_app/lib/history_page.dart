// lib/history_page.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<List<dynamic>> trades = [];

  @override
  void initState() {
    super.initState();
    fetchTrades();
  }

  Future<void> fetchTrades() async {
    final response = await http.get(Uri.parse('http://localhost:3000/api/trades'));

    if (response.statusCode == 200) {
      setState(() {
        trades = List<List<dynamic>>.from(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load trades');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: trades.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: trades.length,
              itemBuilder: (context, index) {
                final trade = trades[index];
                final isLongTrade = trade[1] == 'Long'; // Assuming trade[1] contains 'Long' or 'Short'
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Icon(
                      isLongTrade ? Icons.trending_up : Icons.trending_down,
                      color: isLongTrade ? Colors.green : Colors.red,
                    ),
                    title: Text('${trade[0]} ${trade[1]} (TP) ${trade[2]} : ${trade[3]} RRR'),
                    subtitle: Text('Trade #${index + 1}'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle tap
                    },
                  ),
                );
              },
            ),
    );
  }
}