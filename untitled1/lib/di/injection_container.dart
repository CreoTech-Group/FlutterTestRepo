import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/core/di/core_dependencies.dart';
import 'package:untitled1/core/mapper.dart';
import 'package:untitled1/core/network/api_provider.dart';
import 'package:untitled1/features/users/data/api/user_api.dart';
import 'package:untitled1/features/users/data/response/user_response.dart';
import 'package:untitled1/features/users/di/user_container.dart';
import 'package:untitled1/features/users/domain/model/user.dart';
import 'package:untitled1/features/users/domain/repository/user_repository.dart';
import 'package:untitled1/features/users/domain/usecase/get_users_usecase.dart';
import 'package:untitled1/features/users/presentation/user_presenter.dart';

final getIt = GetIt.instance;

void init() {
  _initCoreDependencies();
  _initUserDependencies();
}

void _initCoreDependencies() {
  final coreDependenciesContainer = CoreDependencyContainer();
  getIt.registerSingleton<http.Client>(coreDependenciesContainer.provideHttpClient());
  getIt.registerLazySingleton<ApiProvider>(() => coreDependenciesContainer.provideApi(getIt()));
}

void _initUserDependencies() {
  final userDependencyProvider = UserDependencyProvider();
  getIt.registerSingleton<UserApi>(userDependencyProvider.provideUserApi(getIt()));
  getIt.registerSingleton<Mapper<UserResponse, User>>(userDependencyProvider.provideUserMapper());
  getIt.registerSingleton<UserRepository>(userDependencyProvider.provideUserRepository(getIt(), getIt()));
  getIt.registerSingleton(GetUsersUseCase(getIt()));
  getIt.registerFactory(() => UserPresenter(getIt()));
}