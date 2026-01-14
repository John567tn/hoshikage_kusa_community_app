import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutData {
  final String description;
  final List<Person> founders;
  final List<Person> originalMembers;
  final List<Person> operators;

  AboutData({
    required this.description,
    required this.founders,
    required this.originalMembers,
    required this.operators,
  });

  factory AboutData.fromJson(Map<String, dynamic> json) {
    return AboutData(
      description: json['description'],
      founders: (json['founders'] as List).map((e) => Person.fromJson(e)).toList(),
      originalMembers: (json['originalMembers'] as List).map((e) => Person.fromJson(e)).toList(),
      operators: (json['operators'] as List).map((e) => Person.fromJson(e)).toList(),
    );
  }
}

class Person {
  final String name;
  final String? bilibili;
  final String? douyin;
  final String? avatar;

  Person({
    required this.name,
    this.bilibili,
    this.douyin,
    this.avatar,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      bilibili: json['bilibili'],
      douyin: json['douyin'],
      avatar: json['avatar'],
    );
  }
}

final AboutData aboutData = AboutData(
  description: 'Hoshikage Kusa 星影茸社区，简称星影茸社区/HKFC，成立于2025年12月15日，是由UP主Gokugo极伍建立及主导的一个以福瑞文化为主的社区。作为一个为爱发电的非盈利性社区，我们为广大福瑞提供一个开放、包容、平等的交流、互动、扩列平台。每一片星影都值得被温柔对待，每一位成员都是社区最珍贵的宝藏。',
  founders: [
    Person(
      name: "Gokugo極伍", 
      bilibili: "https://space.bilibili.com/3546645379680319", 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAAvmrHV_1xt6wxFJgiEwzqNIp0LcjChp9k52sMLW8fTakOKXUE2_6lFuP2xoldAjC3?from_tab_name=main",
      avatar: "assets/avatars/Gokugo極伍.jpg" 
      ),
    //Person(
    //name: 'Ryuuge Kisaki', 
    //bilibili: 'https://space.bilibili.com/3546716110326414', 
    //douyin: null, 
    //avatar: 'assets/avatars/Ryuuge Kisaki.jpg'
    //),
  ],
  originalMembers: [
   Person(
      name: "程风ChFynn", 
      bilibili: "https://space.bilibili.com/3494374434408765", 
      douyin: null, 
      avatar: "assets/avatars/程风ChFynn.jpg" 
    ),
   Person( 
      name: "海江-ProtoWild", 
      bilibili: "https://space.bilibili.com/1028993493", 
      douyin: null, 
      avatar: "assets/avatars/海江-ProtoWild.jpg" 
    ),
    Person( 
      name: "寒星燎夜", 
      bilibili: "https://space.bilibili.com/39351127", 
      douyin: null, 
      avatar: "assets/avatars/寒星燎夜.jpg" 
    ),
    Person( 
      name: "江沁", 
      bilibili: null, 
      douyin: null, 
      avatar: "assets/avatars/江沁.jpg" 
    ),
    Person( 
      name: "普岚-pulan", 
      bilibili: "https://space.bilibili.com/357698032", 
      douyin: null, 
      avatar: "assets/avatars/普岚-pulan.jpg" 
    ),
    Person( 
      name: "Sirus_L", 
      bilibili: "https://space.bilibili.com/4768328", 
      douyin: null, 
      avatar: "assets/avatars/Sirus_L.jpg" 
    ),
    Person( 
      name: "三明治", 
      bilibili: null, 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAAGo__QFCG70IqHe-LmDHABElng0UnW_dVYcKtRej6mbGpLSnHQ_mUacW0tpXVggIF", 
      avatar: "assets/avatars/三明治.jpg" 
    ),
    Person( 
      name: "糖崽", 
      bilibili: null, 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAAf2esREi8lyiTqo3pzSer48v3YFWFUHO0aqOijLrxhLA", 
      avatar: "assets/avatars/糖崽.jpg"
    ),
   // Person( 
    //  name: "威尔德VAID", 
     // bilibili: "https://space.bilibili.com/25104181", 
      //douyin: null,
      //avatar: null, //"assets/avatars/威尔德VAID.jpg"
   // ),
    Person( 
      name: "小橙", 
      bilibili: null, 
      douyin: null, 
      avatar: "assets/avatars/小橙.jpg" 
    ),
    Person( 
      name: "韵临", 
      bilibili: null, 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAAYmzTO3UgGbCYuLrEJfPG7uAaTYAo7nitwQkJ4kZ0Uy60gIqvywHfwcG9uCOxMin-", 
      avatar: "assets/avatars/韵临.jpg" 
    ),
    Person( 
      name: "犽珀牌鸭脖", 
      bilibili: "https://space.bilibili.com/859624", 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAA2lmOJFJg9MptMt_Z0V5ukSNh14HP56FTpLpkcLy_pEX8mIAkqVy5GukmhGtMfvZz?from_tab_name=main&is_search=0&list_name=follow&nt=1", 
      avatar: "assets/avatars/犽珀牌鸭脖.jpg" 
    ),
    Person( 
      name: "夜月", 
      bilibili: "https://space.bilibili.com/1098045312", 
      douyin: null, 
      avatar: "assets/avatars/夜月.jpg" 
    ),
    Person( 
      name: "映昼INZO", 
      bilibili: "https://space.bilibili.com/129876927", 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAAf69KIRE_fT7SCan6IBUBiv6wIkcvJ4tE21dKVPsJ9qE", 
      avatar: "assets/avatars/映昼INZO.jpg" 
    ),
    Person( 
      name: "Altezza秋介", 
      bilibili: null, 
      douyin: null, 
      avatar: "assets/avatars/Altezza秋介.jpg" 
    ),
    Person( 
      name: "寒霓 鲨", 
      bilibili: null, 
      douyin: null, 
      avatar: "assets/avatars/寒霓 鲨.jpg" 
    ),
    Person(
      name: "天朙owo", 
      bilibili: "https://space.bilibili.com/353481151", 
      douyin: null, 
      avatar: "assets/avatars/天朙owo.jpg" 
    ),
    Person( 
      name: "秋冬·海渊", 
      bilibili: "https://space.bilibili.com/3493108572489867", 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAAAWKjKtrNXG8CSfqAx9OSj0_RnSkooC1KNi0az6x7Ix-w8mOOcNOdksvpCvCy67jM?from_tab_name=main", 
      avatar: "assets/avatars/秋冬.jpg" 
    ),
    Person( 
      name: "半江烟雨＿Demiriver", 
      bilibili: null, 
      douyin: null, 
      avatar: "assets/avatars/半江烟雨＿Demiriver.jpg" 
    ),
    Person( 
      name: "木杉木木彡", 
      bilibili: null, 
      douyin: null, 
      avatar: "assets/avatars/木杉木木彡.jpg" 
    ),
    Person( 
      name: "逸柠", 
      bilibili: "https://space.bilibili.com/3546757461969470", 
      douyin: null, 
      avatar: "assets/avatars/逸柠.jpg" 
    ),
    Person( 
      name: "湫笙", 
      bilibili: "https://space.bilibili.com/646032989", 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAAQlAyHiQMcySadxkntO7X8LpjOWkfGtcEQYT_mTiBq8E?from_tab_name=main", 
      avatar: "assets/avatars/湫笙.jpg" 
    ),
    Person( 
      name: "Soda", 
      bilibili: "https://space.bilibili.com/451480183", 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAAurRh_YSbcVcHknHaALBt_fRXfL6qfnU0n49oZCK6Ucea9NL_tuFQGRW9rZ-F_Byc?from_tab_name=main&is_search=0&list_name=follow&nt=0", 
      avatar: "assets/avatars/Sodaaaaaa.jpg" 
    ),
    Person( 
      name: "颜麟", 
      bilibili: null, 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAAM0H7kg-fokElRSRsPCaFkAx2zLeeXeyqTiOodrenZolvLqEggT63GJgD4I3meeQx?from_tab_name=main", 
      avatar: "assets/avatars/颜麟.jpg" 
    ),
    Person( 
      name: "Peterbus",
      bilibili: "https://space.bilibili.com/3546556011645359", 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAApOGUoOxKYSSp7gbNG-sA5zJjJfxXt7j_LRax05i13JKjGEgCokFIDSncsJwOKv2D?from_tab_name=main&is_search=0&list_name=follow&nt=0", 
      avatar: "assets/avatars/Peterbus.jpg" 
    ),
     Person( 
      name: "锐影不吃香菜", 
      bilibili: "https://space.bilibili.com/3546599959562870", 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAAwx1oJeW4BJIA00gPfhDrCNtZyd2YnyPH3ka7kPW5NV4YJjUGB9x4e7nuRLCIGkJY?from_tab_name=main", 
      avatar: "assets/avatars/锐影不吃香菜.jpg" 
     ),
  ],
  
  operators: [
    Person( 
      name: "Gokugo極伍", 
      bilibili: "https://space.bilibili.com/3546645379680319", 
      douyin: "https://www.douyin.com/user/MS4wLjABAAAAvmrHV_1xt6wxFJgiEwzqNIp0LcjChp9k52sMLW8fTakOKXUE2_6lFuP2xoldAjC3?from_tab_name=main", 
      avatar: "assets/avatars/Gokugo極伍.jpg"
    )

  ],
);
