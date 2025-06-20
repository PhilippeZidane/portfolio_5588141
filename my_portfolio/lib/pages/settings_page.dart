import 'package:flutter/material.dart';
import 'summary_page.dart'; // Assure-toi que ce fichier est bien importé

class SettingsPage extends StatefulWidget {
  final Map<String, bool> initialSettings;
  final Map<String, String> formData;
  final double sliderValue;

  const SettingsPage({
    super.key,
    required this.initialSettings,
    required this.formData,
    required this.sliderValue,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Map<String, bool> settings;

  @override
  void initState() {
    super.initState();
    settings = Map.from(widget.initialSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Einstellungen')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CheckboxListTile(
            title: const Text('Newsletter abonnieren'),
            value: settings['newsletter'],
            onChanged: (val) => setState(() => settings['newsletter'] = val!),
          ),
          CheckboxListTile(
            title: const Text('Benachrichtigungen'),
            value: settings['notifications'],
            onChanged: (val) => setState(() => settings['notifications'] = val!),
          ),
          SwitchListTile(
            title: const Text('Dunkler Modus'),
            value: settings['darkMode']!,
            onChanged: (val) => setState(() => settings['darkMode'] = val),
          ),
          SwitchListTile(
            title: const Text('Offline-Modus'),
            value: settings['offlineMode']!,
            onChanged: (val) => setState(() => settings['offlineMode'] = val),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SummaryPage(
                    formData: widget.formData,
                    settings: settings,
                    sliderValue: widget.sliderValue,
                  ),
                ),
              );
            },
            child: const Text('Zur Zusammenfassung'),
          ),
        ],
      ),
    );
  }
}