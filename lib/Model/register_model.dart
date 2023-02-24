class RegisterModel {
  bool? success;
  String? message;
  LoginData? data;

  RegisterModel({this.success, this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ?  LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  int? userId;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneno;
  String? userRole;
  bool? isSubscribe;

  LoginData(
      {this.userId,
        this.username,
        this.email,
        this.firstName,
        this.lastName,
        this.phoneno,
        this.userRole,
        this.isSubscribe});

  LoginData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneno = json['phoneno'];
    userRole = json['user_role'];
    isSubscribe = json['is_subscribe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = userId;
    data['username'] = username;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phoneno'] = phoneno;
    data['user_role'] = userRole;
    data['is_subscribe'] = isSubscribe;
    return data;
  }
}