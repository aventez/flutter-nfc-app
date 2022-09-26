import 'package:flutter/material.dart';

class UserBasicInfo {
  String email;
  bool premium;
  String activeProfileId;
  List<Profile> profiles;

  UserBasicInfo({this.email});

  UserBasicInfo.fromJson(Map<String, dynamic> data) {
    email = data['email'];
    premium = data['premium'];
    activeProfileId = data['activeProfile'];

    var list = data['profiles'] as List;
    profiles = list.map<Profile>((object) => Profile.fromJson(object)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['activeProfileId'] = this.activeProfileId;
    data['profiles'] = this.profiles;
  }
}

class Profile {
  String id;
  String name;
  String job;

  Profile.fromJson(data) {
    id = data['id'];
    name = data['name'];
    job = data['job'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'job': this.job,
    };
  }
}
