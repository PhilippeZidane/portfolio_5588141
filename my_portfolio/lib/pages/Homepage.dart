import 'package:flutter/material.dart';

<<<<<<< HEAD
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
=======
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Willkommen im Portfolio von Fotso Philippe'),
      ),
      body: const Center(
        child: Text('Hier kommt dein Inhalt hin.'),
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Willkommen im Portfolio von Philippe Fotso'),
      ),
      body: const Center(
        child: Text('Hier kommt dein Inhalt hin.'),
      ),
    );
  }
}*/
>>>>>>> Startseite
