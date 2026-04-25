import 'package:flutter/material.dart';

void main() => runApp(const NoteApp());

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotePage(),
    );
  }
}

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final titleController = TextEditingController();
  final textController = TextEditingController();
  final priorityController = TextEditingController();

  void createReport() {
    String title = titleController.text;
    String content = textController.text;

    int priority = int.tryParse(priorityController.text) ?? 1;

    String status = switch (priority) {
      3 => "Высокий (Важно)",
      2 => "Средний (Нормально)",
      _ => "Низкий (Мелочь)",
    };

    print("=== ОТЧЕТ: $title ===");
    print("Содержание: $content");
    print("Приоритет: $status (код $priority)");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Дневник v1.0.2")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: "Заголовок")),
            TextField(controller: textController, decoration: const InputDecoration(labelText: "Текст")),
            TextField(
              controller: priorityController,
              decoration: const InputDecoration(labelText: "Приоритет (1-3)"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: createReport,
                child: const Text("Сформировать отчет в консоль")
            ),
          ],
        ),
      ),
    );
  }
}
