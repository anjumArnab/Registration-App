class User {
  late String userId;
  late String username;
  late String email;
  late String phoneNo;

  User(
      {required this.userId,
      required this.username,
      required this.email,
      required this.phoneNo});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    email = json['email'];
    phoneNo = json['phoneNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    data['email'] = email;
    data['phoneNo'] = phoneNo;
    return data;
  }
}
