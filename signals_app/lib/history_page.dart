// lib/history_page.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<dynamic> trades = [];

  @override
  void initState() {
    super.initState();
    fetchTrades();
  }

  Future<void> fetchTrades() async {
    final response = await http.get(Uri.parse('http://localhost:3000/api/trades'));

    if (response.statusCode == 200) {
      setState(() {
        trades = json.decode(response.body);
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
                if (trade['result'] == null || trade['result'].isEmpty) {
                  return Container(); // Skip active trades
                }
                final isLongTrade = trade['type'] == 'Long';
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Icon(
                      isLongTrade ? Icons.trending_up : Icons.trending_down,
                      color: isLongTrade ? Colors.green : Colors.red,
                    ),
                    title: Text('${trade['pair']} ${trade['type']} (TP) ${trade['tp']} : ${trade['rrr']} RRR'),
                    subtitle: Text('Trade #${trade['id']}'),
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