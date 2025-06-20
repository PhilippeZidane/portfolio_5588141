import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final Map<String, String> formData;
  final Map<String, bool> settings;
  final double sliderValue;

  const SummaryPage({
    Key? key,
    required this.formData,
    required this.settings,
    required this.sliderValue,
  }) : super(key: key);

  Widget buildCard({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ]),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📄 Zusammenfassung')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  buildCard(
                    icon: Icons.person,
                    title: 'Profil',
                    children: [
                      Text('👤 Name: ${formData['name'] ?? ''}'),
                      Text('📧 E-Mail: ${formData['email'] ?? ''}'),
                      Text('📝 Über mich: ${formData['about'] ?? ''}'),
                    ],
                  ),
                  buildCard(
                    icon: Icons.tune,
                    title: 'Slider-Wert',
                    children: [
                      Text('🎚 Aktueller Wert: ${sliderValue.toStringAsFixed(0)}'),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: sliderValue / 100,
                        minHeight: 10,
                        backgroundColor: Colors.grey[300],
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  buildCard(
                    icon: Icons.settings,
                    title: 'Einstellungen',
                    children: [
                      Text('📩 Newsletter: ${settings['newsletter']! ? "Ja" : "Nein"}'),
                      Text('🔔 Benachrichtigungen: ${settings['notifications']! ? "Ja" : "Nein"}'),
                      Text('🌙 Dunkler Modus: ${settings['darkMode']! ? "Aktiv" : "Inaktiv"}'),
                      Text('📴 Offline-Modus: ${settings['offlineMode']! ? "Aktiv" : "Inaktiv"}'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Zurück'),
            ),
          ],
        ),
      ),
    );
  }
}