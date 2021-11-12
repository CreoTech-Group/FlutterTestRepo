import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/core/di/core_dependencies.dart';
import 'package:untitled1/core/network/api_provider.dart';

final getIt = GetIt.instance;

void init() {
  _initCoreDependencies();
}

void _initCoreDependencies() {
  final coreDependenciesContainer = CoreDependencyContainer();
  getIt.registerSingleton<http.Client>(coreDependenciesContainer.provideHttpClient());
  getIt.registerLazySingleton<ApiProvider>(() => coreDependenciesContainer.provideApi(getIt()));
}