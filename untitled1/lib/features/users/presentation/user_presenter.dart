import 'package:rxdart/rxdart.dart';
import 'package:untitled1/features/users/domain/exception/user_exception.dart';
import 'package:untitled1/features/users/domain/model/user.dart';
import 'package:untitled1/features/users/domain/usecase/get_users_usecase.dart';
import 'package:untitled1/features/users/presentation/user_viewmodel.dart';

class UserPresenter {
  final Subject<UserViewModel> _viewModelSubject = BehaviorSubject();
  Stream<UserViewModel> get viewModelStream => _viewModelSubject;

  final GetUsersUseCase _getUsersUseCase;

  UserPresenter(this._getUsersUseCase);

  void getUsers() async {
    _viewModelSubject.add(UserViewModelLoading());
    try {
      final List<User> users = await _getUsersUseCase();
      _viewModelSubject.add(UserViewModelContent(users));
    } on UserException catch(_) {
      _viewModelSubject.add(UserViewModelError());
    }
  }

  void dispose() {
    _viewModelSubject.close();
  }
}