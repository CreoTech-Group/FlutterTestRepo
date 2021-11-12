import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled1/core/network/api_provider.dart';
import 'package:untitled1/core/network/exceptions/bad_request_exception.dart';
import 'package:untitled1/core/network/exceptions/generic_network_exceptioin.dart';
import 'package:untitled1/core/network/exceptions/server_exception.dart';

class ApiProviderImpl implements ApiProvider {
  final String _baseUrl;
  final http.Client _client;

  ApiProviderImpl(this._client, this._baseUrl);

  @override
  Future<dynamic> get(String url) async {
    try {
      final response =
          await _client.get(Uri.https(_baseUrl, url));
      return _parseResponse(response);
    } catch (e) {
      throw GenericNetworkException(e.toString());
    }
  }

  dynamic _parseResponse<T>(http.Response response) {
    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 299) {
      return jsonDecode(response.body);
    } else if (statusCode >= 400 && statusCode < 500) {
      throw BadRequestException(response.toString());
    } else if (statusCode >= 500 && statusCode < 600) {
      throw ServerException(response.body);
    } else {
      throw GenericNetworkException(response.body);
    }
  }
}
