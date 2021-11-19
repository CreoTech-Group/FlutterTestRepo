import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled1/features/users/domain/model/user.dart';
import 'package:untitled1/features/users/domain/repository/user_repository.dart';
import 'package:untitled1/features/users/domain/usecase/get_users_usecase.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  final UserRepository userRepository = MockUserRepository();
  final sut = GetUsersUseCase(userRepository);

  test("call SHOULD return list of Users from repository getUsers", () async {
    final user = User("Vasil", "Paligorov", "vpaligorov@gmail.com", "avatar");
    when(() => userRepository.getUsers()).thenAnswer((_) => Future.value([user]));

    final List<User> users = await sut.call();

    expect(users, [user]);
  });
}