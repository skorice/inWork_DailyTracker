import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final _nameController = TextEditingController();
  String _greeting = '';

  @override
  void dispose() {
    _nameController.dispose(); // ← ВАЖНО: освобождаем ресурсы
    super.dispose();
  }

  void _sayHello() {
    setState(() {
      _greeting = 'Привет, ${_nameController.text}!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Demo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Введи имя',
                hintText: 'Например, Скорице',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _sayHello,
              child: const Text('Поздороваться'),
            ),
            const SizedBox(height: 24),
            Text(
              _greeting,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}Z