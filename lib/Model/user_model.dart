class UserModel {
  int? id;
  String? name;
  String? email;
  String? profilepicture;
  String? location;
  String? createdat;
  String? online;

  UserModel(
      {this.id,
        this.name,
        this.email,
        this.profilepicture,
        this.location,
        this.createdat,
        this.online});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilepicture = json['profilepicture'];
    location = json['location'];
    createdat = json['createdat'];
    online = json['online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['profilepicture'] = profilepicture;
    data['location'] = location;
    data['createdat'] = createdat;
    data['online'] = online ?? true;
    return data;
  }
}
