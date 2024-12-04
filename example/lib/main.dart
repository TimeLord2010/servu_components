import 'package:flutter/material.dart';
import 'package:servu_components/servu_components.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ServButton(
              child: const Text('Simple Button'),
              onPress: () {},
            ),
            ServFilledButton(
              child: const Text('Filled Button'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
