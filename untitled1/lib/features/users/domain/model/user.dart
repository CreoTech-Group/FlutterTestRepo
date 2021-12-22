class User {
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  User(this.firstName, this.lastName, this.email, this.avatar);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
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
    return 'User{firstName: $firstName, lastName: $lastName, email: $email, avatar: $avatar}';
  }
}