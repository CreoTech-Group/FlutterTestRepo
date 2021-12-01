// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> de = {
  "user_list": "Liste der Benutzer",
  "user_list_error": "Fehler beim Laden der Benutzer... Bitte versuchen Sie es erneut",
  "user_list_no_users": "Noch keine Benutzer"
};
static const Map<String,dynamic> en = {
  "user_list": "List of users",
  "user_list_error": "Error loading users... Please try again",
  "user_list_no_users": "No users yet"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"de": de, "en": en};
}
