class UsersModel {
  int id;
  String name;
  String userName;
  String email;
  String phone;

  UsersModel(
    this.id,
    this.name,
    this.userName,
    this.email,
    this.phone,
  );

  UsersModel.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        userName = json['username'],
        email = json['email'],
        phone = json['phone'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'username': userName,
      'email' : email,
      'phone' : phone,
    };
  }
}
