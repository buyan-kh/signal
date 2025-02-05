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
              child: ListView.builder(
                itemCount: 10, // Example item count
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: Icon(Icons.trending_up, color: Colors.green),
                      title: Text('GBP/USD Long (TP) 1 : 3.44 RRR'),
                      subtitle: Text('Trade #${index + 1}'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Total trades: 8'),
                  Text('SL: 2 TP: 6', style: TextStyle(color: Colors.red)),
                  Text('Average winrate: 75%'),
                  Text('Average RRR: 3.125'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}