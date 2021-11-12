import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled1/core/network/api_provider.dart';
import 'package:untitled1/features/users/data/api/user_api_impl.dart';
import 'package:untitled1/features/users/data/response/user_response.dart';

class MockApiProvider extends Mock implements ApiProvider {}

void main() {

  final ApiProvider _apiProvider = MockApiProvider();

  final UserApiImpl sut = UserApiImpl(_apiProvider);

  test('getUsers SHOULD return list of user response WHEN successful api call', () async {
    final usersJson = _UserFixtures.createUsers();
    when(() => _apiProvider.get("/users")).thenAnswer((_) => Future.value(usersJson));

    final List<UserResponse> userResponses = await sut.getUsers();

    expect(userResponses, { UserResponse("Boyan", "Iliev", "boyan@creotech.co", "avatar_url") });
  });
}

class _UserFixtures {
  static Map<String, dynamic> createUsers() {
    return {
      "data": [
        {
          "first_name" : "Boyan",
          "last_name" : "Iliev",
          "email" : "boyan@creotech.co",
          "avatar" : "avatar_url"
        }
      ]
    };
  }
}