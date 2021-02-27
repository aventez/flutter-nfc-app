class UserBasicInfo {
  String email;
  String job;

  UserBasicInfo({this.email, this.job});

  UserBasicInfo.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['job'] = this.job;
    return data;
  }
}
