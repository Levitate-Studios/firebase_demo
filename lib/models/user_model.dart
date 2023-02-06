class UserModel {
  String? name;
  String? mobile;
  String? email;

  UserModel({this.name, this.mobile, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    return data;
  }
}