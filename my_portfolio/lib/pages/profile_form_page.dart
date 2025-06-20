import 'package:flutter/material.dart';

class ProfileFormPage extends StatefulWidget {
  const ProfileFormPage({super.key});

  @override
  State<ProfileFormPage> createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfileFormPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String about = '';

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eingaben bestätigen'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('👤 Name: $name'),
            Text('📧 E-Mail: $email'),
            Text('📝 Über mich: $about'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Dialog schließen
            child: const Text('Abbrechen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Dialog schließen
              Navigator.pop(context, {
                'name': name,
                'email': email,
                'about': about,
              }); // Seite schließen und Daten zurückgeben
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil bearbeiten')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (val) => name = val ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-Mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (val) =>
                    val != null && val.contains('@') ? null : 'Ungültige E-Mail',
                onSaved: (val) => email = val ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Über mich'),
                maxLines: 3,
                onSaved: (val) => about = val ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Absenden'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _showConfirmationDialog();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}