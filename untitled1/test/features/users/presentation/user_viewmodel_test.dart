import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled1/features/users/domain/exception/user_exception.dart';
import 'package:untitled1/features/users/domain/model/user.dart';
import 'package:untitled1/features/users/domain/usecase/get_users_usecase.dart';
import 'package:untitled1/features/users/presentation/user_presenter.dart';
import 'package:untitled1/features/users/presentation/user_viewmodel.dart';

class MockGetUsersUseCase extends Mock implements GetUsersUseCase {}

void main() {
  final GetUsersUseCase _getUsersUseCase = MockGetUsersUseCase();

  final sut = UserPresenter(_getUsersUseCase);

  test("getUsers SHOULD send loading WHEN invoked", () async {
    when(() => _getUsersUseCase()).thenAnswer((_) => Future.value([]));

    sut.getUsers();

    await expectLater(sut.viewModelStream, emits(UserViewModelLoading()));
  });

  test("getUsers SHOULD send users WHEN getUsersUseCase returns users ",
      () async {
    final User actualUser = User("first name", "last name", "email", "avatar");
    final List<User> list = [actualUser];
    when(() => _getUsersUseCase())
        .thenAnswer((_) => Future.value(list));

    sut.getUsers();

    await expectLater(
        sut.viewModelStream,
        emitsInAnyOrder([
          UserViewModelLoading(),
          UserViewModelContent([actualUser])
        ]));
  });

  test("getUsers SHOULD send error WHEN getUsersUseCase throws UserException",
      () async {
    final UserException exception = UserException();
    when(() => _getUsersUseCase()).thenAnswer((_) => Future.error(exception));

    sut.getUsers();

    await expectLater(sut.viewModelStream,
        emitsInOrder([UserViewModelLoading(), UserViewModelError()]));
  });
}
