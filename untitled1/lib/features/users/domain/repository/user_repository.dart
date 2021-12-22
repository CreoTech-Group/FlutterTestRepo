import 'package:untitled1/features/users/domain/model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}