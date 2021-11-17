import 'package:untitled1/core/mapper.dart';
import 'package:untitled1/features/users/data/api/user_api.dart';
import 'package:untitled1/features/users/data/response/user_response.dart';
import 'package:untitled1/features/users/domain/model/user.dart';
import 'package:untitled1/features/users/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserApi _userApi;
  final Mapper<UserResponse, User> _userMapper;

  UserRepositoryImpl(this._userApi, this._userMapper);

  @override
  Future<List<User>> getUsers() async {
    final List<UserResponse> userResponses = await _userApi.getUsers();
    final List<User> users = userResponses.map((userResponse) => _userMapper.map(userResponse)).toList();
    return users;
  }

}