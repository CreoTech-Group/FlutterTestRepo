import 'dart:convert';

class UserListResponse {
  List<Map<String, dynamic>> results;
  UserListResponse({
    required this.results,
  });

  factory UserListResponse.fromMap(Map<String, dynamic> map) {
    return UserListResponse(
      results: List<Map<String, dynamic>>.from(map['data']?.map((x) => x)),
    );
  }

  factory UserListResponse.fromJson(String source) => UserListResponse.fromMap(json.decode(source));
}