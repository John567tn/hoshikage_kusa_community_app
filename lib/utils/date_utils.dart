import '../models/event.dart';

String getCountdownText(String dateRange) {
  // 解析日期范围（格式："2026-01-23(周五)-2026-01-26(周一)"）
  final parts = dateRange.split(' - ');
  final startStr = parts[0].split('(')[0].trim();
  final endStr = parts.length > 1 ? parts[1].split('(')[0].trim() : startStr;
  
  final startDate = DateTime.parse(startStr);
  final endDate = DateTime.parse(endStr);
  final now = DateTime.now();
  
  // 清除时间，只比较日期
  final today = DateTime(now.year, now.month, now.day);
  final start = DateTime(startDate.year, startDate.month, startDate.day);
  final end = DateTime(endDate.year, endDate.month, endDate.day);
  
  // 活动已结束
  if (today.isAfter(end)) {
    return '已结束';
  }
  
  // 活动进行中
  if (today.isAtSameMomentAs(start) || (today.isAfter(start) && today.isBefore(end))) {
    return '进行中';
  }
  
  // 倒计时
  final diff = start.difference(today).inDays;
  if (diff == 0) return '今天';
  if (diff == 1) return '明天';
  return '$diff天后';
}

// 计算状态（未开始/即将开始/已开始）
Map<String, dynamic> calculateEventStatus(String dateRange) {
  return {'key': 'value'}; 
}
  // 实现逻辑类似 Web 版 calculateEventStatus
  // 返回 {text: '未开始', class: 'bg-gray-100'}

