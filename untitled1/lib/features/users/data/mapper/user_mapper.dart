import 'package:untitled1/core/mapper.dart';
import 'package:untitled1/features/users/data/response/user_response.dart';
import 'package:untitled1/features/users/domain/model/user.dart';

class UserMapper extends Mapper<UserResponse, User> {
  @override
  User map(UserResponse input) {
    return User(input.firstName, input.lastName, input.email, input.avatar);
  }
}
