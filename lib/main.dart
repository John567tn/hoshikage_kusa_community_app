import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

void main() {
  runApp(const HoshikageApp());
}

class HoshikageApp extends StatelessWidget {
  const HoshikageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '星影茸社区',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NotoSansSC', 
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('星影茸社区'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LucideIcons.home, size: 64, color: Colors.blue),
            SizedBox(height: 16),
            Text(
              '欢迎来到星影茸社区',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '在这里，每一片星影都值得被温柔对待',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
