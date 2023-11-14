class UserData {
  String name;
  String phone;
  String email;
  String gender;
  String nationality;

  UserData({
    required this.name,
    required this.phone,
    required this.email,
    required this.gender,
    required this.nationality,
  });

  // Factory constructor to create a Person from a map (e.g., JSON)
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
      nationality: json['nationality'] ?? '',
    );
  }

  // Convert the Person object to a map (e.g., for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'gender': gender,
      'nationality': nationality,
    };
  }
}
