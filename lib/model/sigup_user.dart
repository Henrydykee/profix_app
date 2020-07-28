class SignUpUser {
  String name;
  String email;
  String phoneNumber;
  String gender;
  String password;

  SignUpUser(
      {this.name, this.email, this.phoneNumber, this.gender, this.password});

  SignUpUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['password'] = this.password;
    return data;
  }
}
