import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled1/features/users/domain/exception/user_exception.dart';
import 'package:untitled1/features/users/domain/model/user.dart';
import 'package:untitled1/features/users/domain/usecase/get_users_usecase.dart';
import 'package:untitled1/features/users/presentation/user_presenter.dart';

class MockGetUsersUseCase extends Mock implements GetUsersUseCase {}

void main() {
  final GetUsersUseCase _getUsersUseCase = MockGetUsersUseCase();

  final sut = UserPresenter(_getUsersUseCase);

  test("getUsers SHOULD send loading WHEN invoked", () async {
    when(() => _getUsersUseCase()).thenAnswer((_) => Future.value([]));

    sut.getUsers();

    await expectLater(sut.loading, emits(true));
  });

  test("getUsers SHOULD send users WHEN getUsersUseCase returns users ", () async {
    final User actualUser = User("first name", "last name", "email", "avatar");
    when(() => _getUsersUseCase()).thenAnswer((_) => Future.value([actualUser]));

    sut.getUsers();

    await expectLater(sut.users, emits([actualUser]));
  });

  test("getUsers SHOULD send error WHEN getUsersUseCase throws UserException", () async {
    final UserException exception = UserException();
    when(() => _getUsersUseCase()).thenAnswer((_) => Future.error(exception));

    sut.getUsers();

    await expectLater(sut.error, emits(exception));
  });
}