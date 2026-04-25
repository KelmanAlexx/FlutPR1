import 'package:flutter/material.dart';

void main() {
  runApp(const DiaryApp());
}

class DiaryApp extends StatelessWidget {
  const DiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Дневник',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DiaryPage(),
    );
  }
}

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  int _nextNoteNumber = 5;

  void _deleteNote() {
    setState(() {
      if (_nextNoteNumber > 1) {
        _nextNoteNumber--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Приложение "Дневник"'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Номер следующей записи:',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              '$_nextNoteNumber',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _deleteNote,
              icon: const Icon(Icons.delete),
              label: const Text('Удалить запись'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}