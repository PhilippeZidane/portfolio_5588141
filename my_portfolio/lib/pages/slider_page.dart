import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  final double initialValue;

  const SliderPage({super.key, required this.initialValue});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider-Seite')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: _value,
            min: 0,
            max: 100,
            divisions: 100,
            label: _value.round().toString(),
            onChanged: (val) => setState(() => _value = val),
          ),
          Text('Wert: ${_value.round()}'),
          Container(
            height: 100,
            width: _value * 2,
            color: Colors.blue.withOpacity(_value / 100),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, _value),
            child: const Text('Speichern und zurück'),
          ),
        ],
      ),
    );
  }
}