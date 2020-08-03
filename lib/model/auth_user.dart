class SignUpUser {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String gender;
  String password;

  SignUpUser(
      {this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.gender,
        this.password});

  SignUpUser.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['password'] = this.password;
    return data;
  }
}

class UserLogin {
  String email;
  String password;

  UserLogin({this.email, this.password});

  UserLogin.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

