import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProfileSettingsInfo {
  String id;
  String job;
  String name;
  String avatarURL;
  bool isFulfilled;
  ProfileLinks links;

  ProfileSettingsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    job = json['job'];
    name = json['name'];
    isFulfilled = json['isFulfilled'];
    avatarURL = json['avatarURL'];
    links =
        json['links'] != null ? new ProfileLinks.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job'] = this.job;
    data['name'] = this.name;
    data['isFulfilled'] = this.isFulfilled;
    data['avatarURL'] = this.avatarURL;

    if (this.links != null) {
      data['profile'] = this.links.toJson();
    }
    return data;
  }
}

class ProfileLinks {
  String phoneNumber;
  String instagramAccount;
  String twitterAccount;
  String facebookAccount;
  String linkedinAccount;
  String whatsAppNumber;
  String publicEmail;
  String youtubeAccount;
  String soundcloudAccount;
  String tiktokAccount;
  String spotifyAccount;
  String appleMusicAccount;
  String cashAppAccount;
  String venmoAccount;
  String paypalAccount;
  String twitchAccount;
  String snapchatName;
  List<Website> websites;

  ProfileLinks({
    this.phoneNumber,
    this.instagramAccount,
    this.twitterAccount,
    this.facebookAccount,
    this.linkedinAccount,
    this.whatsAppNumber,
    this.publicEmail,
    this.youtubeAccount,
    this.soundcloudAccount,
    this.tiktokAccount,
    this.spotifyAccount,
    this.appleMusicAccount,
    this.cashAppAccount,
    this.venmoAccount,
    this.paypalAccount,
    this.twitchAccount,
    this.snapchatName,
    this.websites,
  });

  ProfileLinks.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    instagramAccount = json['instagramAccount'];
    twitterAccount = json['twitterAccount'];
    facebookAccount = json['facebookAccount'];
    linkedinAccount = json['linkedinAccount'];
    whatsAppNumber = json['whatsAppNumber'];
    publicEmail = json['publicEmail'];
    youtubeAccount = json['youtubeAccount'];
    soundcloudAccount = json['soundcloudAccount'];
    tiktokAccount = json['tiktokAccount'];
    spotifyAccount = json['spotifyAccount'];
    appleMusicAccount = json['appleMusicAccount'];
    cashAppAccount = json['cashAppAccount'];
    venmoAccount = json['venmoAccount'];
    paypalAccount = json['paypalAccount'];
    twitchAccount = json['twitchAccount'];
    snapchatName = json['snapchatName'];

    var list = json['websites'] as List;
    websites = list.map<Website>((object) => Website.fromJson(object)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['instagramAccount'] = this.instagramAccount;
    data['twitterAccount'] = this.twitterAccount;
    data['facebookAccount'] = this.facebookAccount;
    data['linkedinAccount'] = this.linkedinAccount;
    data['whatsAppNumber'] = this.whatsAppNumber;
    data['publicEmail'] = this.publicEmail;
    data['youtubeAccount'] = this.youtubeAccount;
    data['soundcloudAccount'] = this.soundcloudAccount;
    data['tiktokAccount'] = this.tiktokAccount;
    data['spotifyAccount'] = this.spotifyAccount;
    data['appleMusicAccount'] = this.appleMusicAccount;
    data['cashAppAccount'] = this.cashAppAccount;
    data['venmoAccount'] = this.venmoAccount;
    data['paypalAccount'] = this.paypalAccount;
    data['twitchAccount'] = this.twitchAccount;
    data['snapchatName'] = this.snapchatName;
    data['websites'] = this.websites;

    return data;
  }
}

class Website {
  String id;
  String url;
  String name;
  String icon;

  Website({
    this.id,
    this.url,
    this.name,
    this.icon,
  });

  Website.fromJson(data) {
    id = Uuid().v4();
    url = data['url'];
    name = data['name'];
    icon = data['icon'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'url': this.url,
      'name': this.name,
      'icon': this.icon,
    };
  }
}
