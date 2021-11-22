import 'package:rxdart/rxdart.dart';
import 'package:untitled1/features/users/domain/exception/user_exception.dart';
import 'package:untitled1/features/users/domain/model/user.dart';
import 'package:untitled1/features/users/domain/usecase/get_users_usecase.dart';

class UserViewModel {
  final Subject<bool> _loadingSubject = BehaviorSubject();
  Stream<bool> get loading => _loadingSubject;

  final Subject<List<User>> _usersSubject = BehaviorSubject();
  Stream<List<User>> get users => _usersSubject;

  final Subject<UserException> _errorSubject = BehaviorSubject();
  Stream<UserException> get error => _errorSubject;

  final GetUsersUseCase _getUsersUseCase;

  UserViewModel(this._getUsersUseCase);

  void getUsers() async {
    _loadingSubject.add(true);
    try {
      final List<User> users = await _getUsersUseCase();
      _usersSubject.add(users);
    } on UserException catch(e) {
      _errorSubject.add(e);
    }
  }

  void dispose() {
    _loadingSubject.close();
    _usersSubject.close();
    _errorSubject.close();
  }
}