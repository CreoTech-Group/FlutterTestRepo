import 'package:flutter/material.dart';
import 'package:untitled1/features/users/domain/usecase/get_users_usecase.dart';
import 'package:untitled1/features/users/presentation/user_presenter.dart';
import 'package:untitled1/features/users/presentation/users_page.dart';
import 'di/injection_container.dart';
import 'get_data.dart';
import 'list_item.dart';
import 'items.dart';
import 'package:untitled1/items_info.dart';
import 'package:untitled1/di/injection_container.dart' as di;

void main() {
  di.init();
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/info': (context) => ItemsInfo(),
      '/home': (context) => UsersPage(getIt()),
    },
  ));
}
