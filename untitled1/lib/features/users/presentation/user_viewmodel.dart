import 'package:untitled1/features/users/domain/model/user.dart';

abstract class UserViewModel {}

class UserViewModelLoading extends UserViewModel {

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserViewModelLoading && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class UserViewModelContent extends UserViewModel {
  final List<User> users;
  UserViewModelContent(this.users);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserViewModelContent &&
          runtimeType == other.runtimeType &&
          users == other.users;

  @override
  int get hashCode => users.hashCode;
}

class UserViewModelError extends UserViewModel {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserViewModelError && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}