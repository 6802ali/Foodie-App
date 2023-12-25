class UserModel {
  final int age;
  final String email;
  final String firstname;
  final int id;
  final String lastname;
  final String password;

  UserModel({
    required this.age,
    required this.email,
    required this.firstname,
    required this.id,
    required this.lastname,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      age: json['age'] ?? 0,
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      password: json['password'] ?? '',
      email: json['email'] ?? '',
    );
  }

  @override
  String toString() {
    return 'RestaurantModel{id: $id, age: $age, firstname: $firstname, lastname: $lastname, password: $password, email: $email}';
  }
}
