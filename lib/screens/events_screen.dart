import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/event_card.dart';
import '../data/mock_events.dart';
import 'dart:ui'; 

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('兽聚资讯'),
      
        centerTitle: true,
      ),
      body: mockEvents.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.calendar, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('暂无兽聚信息', style: TextStyle(fontSize: 18)),
                ],
              ),
            )
          : ListView.builder(
              itemCount: mockEvents.length,
              itemBuilder: (context, index) {
                return EventCard(event: mockEvents[index]);
              },
            ),
    );
  }
}
