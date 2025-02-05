// lib/subscription_page.dart
import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Serial Key',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Redeem action
              },
              child: Text('Redeem'),
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[300],
              child: Text('lorem ipsum lorem ipsum\nlorem ipsum lorem ipsum'),
            ),
          ],
        ),
      ),
    );
  }
}