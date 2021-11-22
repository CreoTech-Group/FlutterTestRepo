import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled1/core/mapper.dart';
import 'package:untitled1/features/users/data/api/user_api.dart';
import 'package:untitled1/features/users/data/repository/user_repository_impl.dart';
import 'package:untitled1/features/users/data/response/user_response.dart';
import 'package:untitled1/features/users/domain/exception/user_exception.dart';
import 'package:untitled1/features/users/domain/model/user.dart';

class MockUserApi extends Mock implements UserApi {}
class MockUserMapper extends Mock implements Mapper<UserResponse, User> {}

void main() {
  final UserApi userApi = MockUserApi();
  final Mapper<UserResponse, User> userMapper = MockUserMapper();

  final sut = UserRepositoryImpl(userApi, userMapper);

  test("getUsers SHOULD return list of users WHEN api is successful", () async {
    final UserResponse userResponse = UserResponse("first name", "last name", "email", "avatar");
    final User expectedUser = User("first name", "last name", "email", "avatar");
    when(() => userApi.getUsers()).thenAnswer((invocation) => Future.value([userResponse]));
    when(() => userMapper.map(userResponse)).thenReturn(expectedUser);

    final List<User> users = await sut.getUsers();

    expect(users, [expectedUser]);
  });

  test("getUsers SHOULD throw UserException WHEN api fails", () {
    when(() => userApi.getUsers()).thenAnswer((invocation) => Future.error(Exception()));

    expect(() async => await sut.getUsers(), throwsA(isA<UserException>()));
  });
}