import 'package:elearn_app/common/widgets/flutter_toast.dart';
import 'package:elearn_app/pages/sign_up/bloc/signup_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpController {
  final BuildContext context;

  const SignUpController(this.context);

  void handleEmailSignUp() async {
    final state = context.read<SignUpBlocs>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (userName.isEmpty) {
      toastInfo(msg: "Username can not be empty.");
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty.");
      return;
    }

    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty.");
      return;
    }

    if (confirmPassword.isEmpty) {
      toastInfo(msg: "Password did not match.");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if(credential.user != null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "An email has been sent to your email address, activate and continue.");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "${e.message}");
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "${e.message}");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "Invalid Email address.");
      }
    }
  }
}
