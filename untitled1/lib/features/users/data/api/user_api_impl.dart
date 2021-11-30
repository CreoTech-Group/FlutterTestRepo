import 'package:untitled1/core/network/api_provider.dart';
import 'package:untitled1/features/users/data/api/user_api.dart';
import 'package:untitled1/features/users/data/response/user_list_response.dart';
import 'package:untitled1/features/users/data/response/user_response.dart';

class UserApiImpl implements UserApi {
  final ApiProvider _apiProvider;

  UserApiImpl(this._apiProvider);

  @override
  Future<List<UserResponse>> getUsers() async {
    final Map<String, dynamic> usersJson = await _apiProvider.get('/users');
    final UserListResponse usersResponse = UserListResponse.fromMap(usersJson);
    return usersResponse.results
        .map((userMap) => UserResponse.fromMap(userMap))
        .toList();
  }
}
