import 'package:elearn_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elearn_app/pages/welcome/bloc/welcome_blocs.dart';

import '../app_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        BlocProvider(lazy: false, create: (context) => AppBlocks()),
        BlocProvider(create: (context) => SignInBloc())
      ];
}
