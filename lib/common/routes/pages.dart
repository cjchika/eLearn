import 'package:elearn_app/global.dart';
import 'package:elearn_app/pages/application/bloc/app_blocs.dart';
import 'package:elearn_app/pages/home/bloc/home_page_blocs.dart';
import 'package:elearn_app/pages/home/home_page.dart';
import 'package:elearn_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:elearn_app/pages/profile/settings/settings_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elearn_app/pages/application/application_page.dart';
import 'package:elearn_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:elearn_app/pages/sign_in/sign_in.dart';
import 'package:elearn_app/pages/sign_up/bloc/signup_blocs.dart';
import 'package:elearn_app/pages/sign_up/sign_up.dart';
import 'package:elearn_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter/material.dart';

import '../../pages/welcome/welcome.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGNIN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGNUP,
        page: const SignUp(),
        bloc: BlocProvider(create: (_) => SignUpBlocs()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBlocs()),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBlocs()),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: const SettingsPage(),
        bloc: BlocProvider(create: (_) => SettingsBlocs()),
      ),
    ];
  }

  // RETURN ALL BLOC PROVIDERS
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // MODAL THAT COVERS ENTIRE SCREEN WHEN NAVIGATOR OBJECT IS CLICKED
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // CHECKS FOR ROUTE NAME MATCHING WHEN NAVIGATOR GET TRIGGERED
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        // print("First Log");
        print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("Invalid route name ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

// UNIFY BLOCPROVIDERS, ROUTES AND PAGES
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
