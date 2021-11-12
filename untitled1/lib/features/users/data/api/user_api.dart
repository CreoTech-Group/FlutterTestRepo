import 'package:untitled1/features/users/data/response/user_response.dart';

abstract class UserApi {
  Future<List<UserResponse>> getUsers();
}