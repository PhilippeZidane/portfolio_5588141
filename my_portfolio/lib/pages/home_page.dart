import 'package:flutter/material.dart';
import 'slider_page.dart';
import 'profile_form_page.dart';
import 'settings_page.dart';
import 'summary_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sliderValue = 50;
  Map<String, String> formData = {};
  Map<String, bool> settings = {
    'newsletter': false,
    'notifications': false,
    'darkMode': false,
    'offlineMode': false,
  };

  void navigateToSliderPage() async {
    final result = await Navigator.push<double>(
      context,
      MaterialPageRoute(builder: (_) => SliderPage(initialValue: sliderValue)),
    );
    if (result != null) setState(() => sliderValue = result);
  }

  void navigateToProfileFormPage() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (_) => const ProfileFormPage()),
    );
    if (result != null) setState(() => formData = result);
  }

  void navigateToSettingsPage() async {
  final result = await Navigator.push<Map<String, bool>>(
    context,
    MaterialPageRoute(
      builder: (_) => SettingsPage(
        initialSettings: settings,
        formData: formData,
        sliderValue: sliderValue,
      ),
    ),
  );
  if (result != null) setState(() => settings = result);
}


  void navigateToSummaryPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SummaryPage(
          formData: formData,
          settings: settings,
          sliderValue: sliderValue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio von Philippe Fotso')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: navigateToSliderPage, child: const Text('Slider-Seite')),
            ElevatedButton(onPressed: navigateToProfileFormPage, child: const Text('Profil bearbeiten')),
            ElevatedButton(onPressed: navigateToSettingsPage, child: const Text('Einstellungen')),
            ElevatedButton(onPressed: navigateToSummaryPage, child: const Text('Zusammenfassung')),
          ],
        ),
      ),
    );
  }
} 