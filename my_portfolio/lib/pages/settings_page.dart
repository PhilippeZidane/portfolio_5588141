import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool newsletter = false;
  bool updates = false;
  bool darkMode = false;
  bool offlineMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Einstellungen')),
      body: ListView(
        children: [
          CheckboxListTile(
            title: const Text('Newsletter abonnieren'),
            value: newsletter,
            onChanged: (val) => setState(() => newsletter = val!),
          ),
          CheckboxListTile(
            title: const Text('Updates erhalten'),
            value: updates,
            onChanged: (val) => setState(() => updates = val!),
          ),
          SwitchListTile(
            title: const Text('Dunkler Modus'),
            value: darkMode,
            onChanged: (val) => setState(() => darkMode = val),
          ),
          SwitchListTile(
            title: const Text('Offline-Modus'),
            value: offlineMode,
            onChanged: (val) => setState(() => offlineMode = val),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Ausgewählt:\n'
              '- Newsletter: ${newsletter ? "Ja" : "Nein"}\n'
              '- Updates: ${updates ? "Ja" : "Nein"}\n'
              '- Dunkler Modus: ${darkMode ? "Ja" : "Nein"}\n'
              '- Offline: ${offlineMode ? "Ja" : "Nein"}',
            ),
          )
        ],
      ),
    );
  }
}
