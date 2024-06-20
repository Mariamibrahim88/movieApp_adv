class SignInModel {
  final String email;
  final String password;
  final String name;
  final int age;

  SignInModel(
      {required this.email,
      required this.password,
      required this.name,
      required this.age});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      age: json['age'],
    );
  }
}
