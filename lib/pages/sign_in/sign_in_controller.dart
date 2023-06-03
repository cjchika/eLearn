// import 'dart:math';

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
          print("Email is empty");
        } else {
          print("$emailAddress");
        }
        if (password.isEmpty) {
          print("Password is empty");
        } else {
          print("$password");
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            print("User does not exist");
          }
          if (!credential.user!.emailVerified) {
            print("User not verified");
          }

          var user = credential.user;
          if (user != null) {
            // we got verified user from Firebase
            print("User exists");
          } else {
            // Error getting user from Firebase
            print("No user");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print("No user found with that email.");
            //toastInfo(msg: "No user found with that email.");
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user');
            //toastInfo(msg: "Wrong password provided for that user.");
          } else if (e.code == 'invalid-email') {
            print('Your email format is incorrect.');
            //toastInfo(msg: "Wrong password provided for that user.");
          }
        }
      }
    } catch (e) {
      print("Error");
    }
  }
}
