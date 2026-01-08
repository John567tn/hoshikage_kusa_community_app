import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../models/event.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/date_utils.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 顶部标签
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    event.tag,
                    style: TextStyle(fontSize: 12, color: Colors.purple[800]),
                  ),
                ),
                const Spacer(),
                if (event.isPinned)
                  const Icon(LucideIcons.pin, size: 16, color: Colors.purple),
              ],
            ),
            const SizedBox(height: 12),
            // 标题
            Text(
              event.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // 日期和地点
            Row(
              children: [
                Icon(LucideIcons.calendar, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(event.date, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                const SizedBox(width: 16),
                Icon(LucideIcons.mapPin, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Expanded(child: Text(event.location, style: TextStyle(fontSize: 12, color: Colors.grey[600]))),
                const Spacer(),
                 const Spacer(),
            // 倒计时标签
             Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                   color: Colors.green[100],
                   borderRadius: BorderRadius.circular(12),
                  ),
                child: Text(
                    getCountdownText(event.date),
                   style: TextStyle(fontSize: 12, color: Colors.green[800]),
                 ),
                ),
               if (event.isPinned) ...[
                   const SizedBox(width: 8),
                   const Icon(LucideIcons.pin, size: 16, color: Colors.purple),
              ],
            ],
            ),
            const SizedBox(height: 8),
            // 内容
            Text(event.content, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),
            // 按钮
            if (event.url != null)
              ElevatedButton.icon(
                onPressed: () async {
                 final uri = Uri.parse(event.url!);
                   if (await canLaunchUrl(uri)) {
                     await launchUrl(uri, mode: LaunchMode.externalApplication);
                   } 
                 },
                   icon: const Icon(LucideIcons.externalLink, size: 16),
                   label: const Text('了解活动详情'),
                ),
          ],
        ),
      ),
    );
  }
}
