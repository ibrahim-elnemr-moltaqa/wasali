import 'dart:io';

import 'package:equatable/equatable.dart';

class ContactUsEntity extends Equatable {
  const ContactUsEntity({
    required this.x,
    required this.tiktok,
    required this.instagram,
    required this.facebook,
    required this.snapchat,
    required this.email,
    required this.youtube,
    required this.whatsapp,
    required this.mobiles,
    required this.appStore,
    required this.playStore,
  });

  final String x;
  final String tiktok;
  final String instagram;
  final String facebook;
  final String snapchat;
  final String youtube;
  final String email;
  final String whatsapp;
  final List<String> mobiles;
  final String appStore;
  final String playStore;

  List<String> get getSocialLinks {
    return [
      if (x.isNotEmpty) x,
      if (tiktok.isNotEmpty) tiktok,
      if (instagram.isNotEmpty) instagram,
      if (facebook.isNotEmpty) facebook,
      if (snapchat.isNotEmpty) snapchat,
      if (youtube.isNotEmpty) youtube,
      // if (playStore.isNotEmpty) playStore,
      // if (appStore.isNotEmpty) appStore,
    ];
  }

  String get getStoreLink {
    if (Platform.isAndroid) {
      return playStore;
    } else {
      return appStore;
    }
  }

  @override
  List<Object?> get props => [
        x,
        tiktok,
        instagram,
        facebook,
        snapchat,
        youtube,
        email,
        whatsapp,
        mobiles,
        appStore,
        playStore,
      ];

  factory ContactUsEntity.fromJson(Map<String, dynamic> json) {
    return ContactUsEntity(
      email: json["value"]['email'] ?? "",
      x: json["value"]['twitter'],
      tiktok: json["value"]['tikTok'] ?? "",
      instagram: json["value"]['instagram'] ?? "",
      facebook: json["value"]['facebook'] ?? "",
      snapchat: json["value"]['snapchat'] ?? "",
      youtube: json["value"]['youtube'] ?? "",
      mobiles: json["value"]['mobile'] != null ? List<String>.from(json["value"]['mobile']) : [],
      whatsapp: json["value"]['whatsapp'] ?? "",
      playStore: json["value"]["play_store"] ?? "",
      appStore: json["value"]["app_store"] ?? "",
    );
  }
}
