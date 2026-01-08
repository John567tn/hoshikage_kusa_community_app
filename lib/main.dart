import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'screens/events_screen.dart';

void main() {
  runApp(const HoshikageApp());
}

class HoshikageApp extends StatelessWidget {
  const HoshikageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '星影茸社区',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'NotoSansSC',
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/events': (context) => const EventsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget { // ✅ 唯一一个 HomeScreen
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('星影茸社区'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(LucideIcons.home, size: 64, color: Color(0xFF9C70FF)),
            const SizedBox(height: 16),
            const Text(
              '欢迎来到星影茸社区',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '在这里，每一片星影都值得被温柔对待',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/events'),
              icon: const Icon(LucideIcons.map),
              label: const Text('查看兽聚资讯'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
