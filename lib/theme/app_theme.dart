import 'package:flutter/material.dart';

class AppColors {
  // 主色调（HOFA 品牌色）
  static const primaryPurple = Color(0xFF9C70FF); // 星影紫
  static const secondaryBlue = Color(0xFF70B8FF); // 极伍蓝
  static const accentPink = Color(0xFFFF70C7); // 绒毛粉
  
  // 背景
  static const backgroundLight = Color(0xFFF8F9FA); // 原来的浅色背景
  static const backgroundDark = Color(0xFF0A0A0A); // 未来的深色模式
  
  // 文字
  static const textPrimary = Color(0xFF1A1A1A);
  static const textSecondary = Color(0xFF6C757D);
  
  // 卡片阴影（iOS 弥散阴影参数）
  static const shadowColor = Color(0x1A000000); // 5% 透明度的黑色
}

class AppRadius {
  static const small = Radius.circular(8);
  static const medium = Radius.circular(16);
  static const large = Radius.circular(24); // iOS 风格大圆角
  static const squircle = Radius.circular(20); // 连续曲率
}

class AppShadows {
  // iOS 弥散阴影
  static final card = BoxShadow(
    color: AppColors.shadowColor,
    blurRadius: 20,
    offset: const Offset(0, 8),
    spreadRadius: 0,
  );
}
