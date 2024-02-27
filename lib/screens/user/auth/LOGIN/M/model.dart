class UserModel {
  UserInfo? userInfo;
  int? status;
  String? msg;

  UserModel({this.userInfo, this.status, this.msg});

  UserModel.fromJson(Map<String, dynamic> json) {
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo!.toJson();
    }
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
}

class UserInfo {
  String? userId;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  UserInfo(
      {this.userId,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
