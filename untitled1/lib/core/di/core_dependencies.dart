import 'package:http/http.dart' as http;
import 'package:untitled1/core/network/api_provider.dart';
import 'package:untitled1/core/network/api_provider_impl.dart';

class CoreDependencyContainer {
  ApiProvider provideApi(http.Client client) {
    return ApiProviderImpl(
        client, 'https://reqres.in/api');
  }

  http.Client provideHttpClient() {
    return http.Client();
  }
}
