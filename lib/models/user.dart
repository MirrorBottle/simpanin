class UserModel {
  final String id;
  String email;
  String name;
  String address;
  String phone;
  String role;
  String? password;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.address,
    required this.phone,
    required this.role,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> _json) {
    return UserModel(
      id: _json['id'],
      email: _json['email'],
      name: _json['name'],
      address: _json['address'],
      phone: _json['phone'],
      role: _json['role'],
      password: _json['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'address': address,
      'phone': phone,
      'role': role,
      'password': password,
    };
  }
}
