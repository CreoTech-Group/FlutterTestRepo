import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/desktop_widget.dart';
import 'package:untitled1/features/users/domain/usecase/get_users_usecase.dart';
import 'package:untitled1/features/users/presentation/user_presenter.dart';
import 'package:untitled1/features/users/presentation/users_page.dart';
import 'package:untitled1/mobile_widget.dart';
import 'package:untitled1/responsive_widget.dart';
import 'di/injection_container.dart';
import 'generated/codegen_loader.g.dart';
import 'get_data.dart';
import 'list_item.dart';
import 'items.dart';
import 'package:untitled1/items_info.dart';
import 'package:untitled1/di/injection_container.dart' as di;

Future<void> main() async {
  di.init();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('de')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    assetLoader: const CodegenLoader(),
    startLocale: const Locale('en'),
    child: Builder(builder: (context) {
      return MaterialApp(
        initialRoute: '/home',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routes: {
          '/info': (context) => const ItemsInfo(),
          '/home': (context) => ResponsiveWidget(
                mobileWidget: UsersPage(getIt()),
                desktopWidget: const MobileWidget(),
              ),
        },
      );
    }),
  ));
}
