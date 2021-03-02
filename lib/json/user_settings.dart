class UserSettingsInfo {
  String email;
  String job;
  String name;
  bool isFulfilled;
  Profile profile;

  UserSettingsInfo({this.email, this.job, this.profile});

  UserSettingsInfo.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    job = json['job'];
    name = json['name'];
    isFulfilled = json['isFulfilled'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['job'] = this.job;
    data['name'] = this.name;
    data['isFulfilled'] = this.isFulfilled;

    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    return data;
  }
}

class Profile {
  String phoneNumber;
  String instagramAccount;
  String twitterAccount;
  String facebookAccount;
  String linkedinAccount;
  String whatsAppNumber;
  String publicEmail;
  String youtubeAccount;
  String tiktokAccount;
  String spotifyAccount;
  String appleMusicAccount;
  String cashAppAccount;
  String venmoAccount;
  String paypalAccount;
  String twitchAccount;
  String snapchatName;
  String website;

  Profile(
      {this.phoneNumber,
      this.instagramAccount,
      this.twitterAccount,
      this.facebookAccount,
      this.linkedinAccount,
      this.whatsAppNumber,
      this.publicEmail,
      this.youtubeAccount,
      this.tiktokAccount,
      this.spotifyAccount,
      this.appleMusicAccount,
      this.cashAppAccount,
      this.venmoAccount,
      this.paypalAccount,
      this.twitchAccount,
      this.snapchatName,
      this.website});

  Profile.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    instagramAccount = json['instagramAccount'];
    twitterAccount = json['twitterAccount'];
    facebookAccount = json['facebookAccount'];
    linkedinAccount = json['linkedinAccount'];
    whatsAppNumber = json['whatsAppNumber'];
    publicEmail = json['publicEmail'];
    youtubeAccount = json['youtubeAccount'];
    tiktokAccount = json['tiktokAccount'];
    spotifyAccount = json['spotifyAccount'];
    appleMusicAccount = json['appleMusicAccount'];
    cashAppAccount = json['cashAppAccount'];
    venmoAccount = json['venmoAccount'];
    paypalAccount = json['paypalAccount'];
    twitchAccount = json['twitchAccount'];
    snapchatName = json['snapchatName'];
    website = json['website'];
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
    data['tiktokAccount'] = this.tiktokAccount;
    data['spotifyAccount'] = this.spotifyAccount;
    data['appleMusicAccount'] = this.appleMusicAccount;
    data['cashAppAccount'] = this.cashAppAccount;
    data['venmoAccount'] = this.venmoAccount;
    data['paypalAccount'] = this.paypalAccount;
    data['twitchAccount'] = this.twitchAccount;
    data['snapchatName'] = this.snapchatName;
    data['website'] = this.website;
    return data;
  }
}
