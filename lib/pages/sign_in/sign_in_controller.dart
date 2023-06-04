// import 'dart:math';

import 'package:elearn_app/common/widgets/flutter_toast.dart';
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
          toastInfo(msg: "Email field cannot be empty.");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "Password field cannot be empty.");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "User account does not exist.");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "Email not verified.");
            return;
          }

          var user = credential.user;
          if (user != null) {
            // we got verified user from Firebase
            print("User exists");
            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
            return;
          } else {
            // Error getting user from Firebase
            toastInfo(msg: "Account not found, please signup.");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print("No user found with that email.");
            toastInfo(msg: "No user found with that email.");
            return;
          } else if (e.code == 'wrong-password') {
            print('Wrong password.');
            toastInfo(msg: "Wrong password.");
            return;
          } else if (e.code == 'invalid-email') {
            print('Your email format is incorrect.');
            toastInfo(msg: "Incorrect email format.");
            return;
          }
        }
      }
    } catch (e) {
      print("Error");
    }
  }
}
