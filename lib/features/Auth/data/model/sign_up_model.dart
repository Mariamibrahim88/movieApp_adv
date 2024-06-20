class SignUpModel {
  final String email;
  final String password;
  final String name;
  final int age;

  SignUpModel(
      {required this.email,
      required this.password,
      required this.name,
      required this.age});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      age: json['age'],
    );
  }
}
