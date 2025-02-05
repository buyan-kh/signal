// lib/history_page.dart
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
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
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(title: Text('1. GBP/USD Long (TP) 1 : 3.44 RRR')),
                  // Add more list items here
                ],
              ),
            ),
            Text('Total trades: 8'),
            Text('SL: 2 TP: 6', style: TextStyle(color: Colors.red)),
            Text('Average winrate: 75%'),
            Text('Average RRR: 3.125'),
          ],
        ),
      ),
    );
  }
}