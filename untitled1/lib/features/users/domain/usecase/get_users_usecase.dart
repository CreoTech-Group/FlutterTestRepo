import 'package:untitled1/features/users/domain/model/user.dart';
import 'package:untitled1/features/users/domain/repository/user_repository.dart';

class GetUsersUseCase {
  final UserRepository _userRepository;

  GetUsersUseCase(this._userRepository);

  Future<List<User>> call() {
    return _userRepository.getUsers();
  }
}