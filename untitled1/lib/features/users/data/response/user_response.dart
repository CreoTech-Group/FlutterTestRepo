import 'dart:convert';

class UserResponse {
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  UserResponse(this.firstName, this.lastName, this.email, this.avatar);

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
        map['first_name'], map['last_name'], map['email'], map['avatar']);
  }

  factory UserResponse.fromJson(String source) =>
      UserResponse.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserResponse &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          email == other.email &&
          avatar == other.avatar;

  @override
  int get hashCode =>
      firstName.hashCode ^ lastName.hashCode ^ email.hashCode ^ avatar.hashCode;

  @override
  String toString() {
    return 'UserResponse{firstName: $firstName, lastName: $lastName, email: $email, avatar: $avatar}';
  }
}
