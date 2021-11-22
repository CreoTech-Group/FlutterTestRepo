import 'package:flutter_test/flutter_test.dart';
import 'package:untitled1/features/users/data/mapper/user_mapper.dart';
import 'package:untitled1/features/users/data/response/user_response.dart';
import 'package:untitled1/features/users/domain/model/user.dart';

void main() {

  final sut = UserMapper();

  test("map SHOULD return User WHEN UserResponse provided", () {
    final UserResponse userResponse = UserResponse("first name", "last name", "email", "avatar");

    final User actualUser = sut.map(userResponse);

    expect(actualUser, User("first name", "last name", "email", "avatar"));
  });
}