import 'package:untitled1/core/mapper.dart';
import 'package:untitled1/core/network/api_provider.dart';
import 'package:untitled1/features/users/data/api/user_api.dart';
import 'package:untitled1/features/users/data/api/user_api_impl.dart';
import 'package:untitled1/features/users/data/mapper/user_mapper.dart';
import 'package:untitled1/features/users/data/repository/user_repository_impl.dart';
import 'package:untitled1/features/users/data/response/user_response.dart';
import 'package:untitled1/features/users/domain/model/user.dart';
import 'package:untitled1/features/users/domain/repository/user_repository.dart';

class UserDependencyProvider {
  UserApi provideUserApi(ApiProvider apiProvider) {
    return UserApiImpl(apiProvider);
  }

  Mapper<UserResponse, User> provideUserMapper() {
    return UserMapper();
  }

  UserRepository provideUserRepository(UserApi userApi, Mapper<UserResponse, User> userMapper) {
    return UserRepositoryImpl(userApi, userMapper);
  }
}