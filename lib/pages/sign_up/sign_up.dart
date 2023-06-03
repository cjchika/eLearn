import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar("Sign Up"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: reusableText(
                      "Enter your details below and sign up for free.")),
              Container(
                margin: EdgeInsets.only(top: 40.h),
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("User name"),
                    buildTextField("Enter your username", "name", "user",
                        (value) {
                      print("Ok");
                      // context.read<SignInBloc>().add(EmailEvent(value));
                    }),
                    reusableText("Email"),
                    buildTextField("Enter your email address", "email", "user",
                        (value) {
                      print("Ok");
                      // context.read<SignInBloc>().add(EmailEvent(value));
                    }),
                    reusableText("Password"),
                    SizedBox(height: 5.h),
                    buildTextField("Enter your password", "password", "lock",
                        (value) {
                      print("Ok");
                      // context.read<SignInBloc>().add(PasswordEvent(value));
                    }),
                    reusableText("Confirm Password"),
                    SizedBox(height: 5.h),
                    buildTextField("Re-enter your password", "password", "lock",
                        (value) {
                      print("Ok");
                      // context.read<SignInBloc>().add(PasswordEvent(value));
                    })
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25.w),
                child: reusableText(
                    "By creating an account, you have agreed with our terms and conditions."),
              ),
              buildLoginAndSignupButton("Sign up", "login", () {
                Navigator.of(context).pushNamed("signUpPage");
              }),
            ],
          ),
        ),
      )),
    );
  }
}
