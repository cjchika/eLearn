import 'package:elearn_app/common/routes/pages.dart';
import 'package:elearn_app/pages/application/application_page.dart';
import 'package:elearn_app/pages/bloc_providers.dart';
import 'package:elearn_app/pages/sign_in/sign_in.dart';
import 'package:elearn_app/pages/sign_up/sign_up.dart';
import 'package:elearn_app/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // home: const Welcome(),
            // initialRoute: "/",
            onGenerateRoute: AppPages.generateRouteSettings,
            // routes: {
            //   "signInPage":(context)=> const SignIn(),
            //   "signUpPage":(context)=> const SignUp(),
            // },
          ),
        ));
  }
}