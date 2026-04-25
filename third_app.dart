import 'package:flutter/material.dart';

void main() => runApp(const MoodApp());

class MoodApp extends StatelessWidget {
  const MoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MoodPage(),
    );
  }
}

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  Color bgColor = Colors.grey;
  String moodText = "Нейтральное";

  void _changeMood(Color newColor, String text) {
    setState(() {
      bgColor = newColor;
      moodText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Цвет настроения")),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: bgColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Настроение: $moodText",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => _changeMood(Colors.orange, "Радостное"),
                  child: const Text("Радость"),
                ),
                ElevatedButton(
                  onPressed: () => _changeMood(Colors.blue, "Спокойное"),
                  child: const Text("Покой"),
                ),
                ElevatedButton(
                  onPressed: () => _changeMood(Colors.redAccent, "Энергичное"),
                  child: const Text("Драйв"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
