import 'package:elearn_app/pages/sign_up/bloc/signup_blocs.dart';
import 'package:elearn_app/pages/sign_up/bloc/signup_events.dart';
import 'package:elearn_app/pages/sign_up/bloc/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import '../sign_in/bloc/sign_in_blocs.dart';
import '../sign_in/bloc/sign_in_events.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBlocs, SignUpStates>(builder: (context, state){
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
                                context.read<SignUpBlocs>().add(UserNameEvents(value));
                              }),
                          reusableText("Email"),
                          buildTextField("Enter your email address", "email", "user",
                                  (value) {
                                context.read<SignUpBlocs>().add(EmailEvents(value));
                              }),
                          reusableText("Password"),
                          SizedBox(height: 5.h),
                          buildTextField("Enter your password", "password", "lock",
                                  (value) {
                                context.read<SignUpBlocs>().add(PasswordEvents(value));
                              }),
                          reusableText("Confirm Password"),
                          SizedBox(height: 5.h),
                          buildTextField("Re-enter your password", "password", "lock",
                                  (value) {
                                context.read<SignUpBlocs>().add(ConfirmPasswordEvents(value));
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
    });
  }
}
