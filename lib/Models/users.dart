class User {
  Data data;
  bool status;

  User({
    required this.data,
    required this.status,
  });
}

class Data {
  int id;
  String name;
  String email;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>; // Check for 'data' key

    return Data(
      id: data['id'] as int,
      name: data['name'] as String,
      email: data['email'] as String,
      createdAt: data['created_at'] != null
          ? DateTime.parse(data['created_at'] as String)
          : null,
      updatedAt: data['updated_at'] != null
          ? DateTime.parse(data['updated_at'] as String)
          : null,
    );
  }
}
