class LoginModel {

  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  factory LoginModel.empty() {
    return LoginModel(email: '', password: '');
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

}