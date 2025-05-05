import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Scaffold(
        tittle : Text('Portfolio')
      ),
      body: Center(
        child: Text('Willkommen im meinem Portfolio'),
      ),
    );
  }
}
