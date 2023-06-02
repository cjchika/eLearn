import 'package:elearn_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  const SignInController({required this.context});

  final BuildContext context;

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //
        }
        if (password.isEmpty) {
          //
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if(credential.user==null) {
            //
          }
          if(!credential.user!.emailVerified){
            //
          }

          var user = credential.user;
          if(user!=null){
            // we got verified user from Firebase
          } else{
            // Error getting user from Firebase
          }
        } catch (e) {}
      }
    } catch (e) {
      //
    }
  }
}
