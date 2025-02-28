class User {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
