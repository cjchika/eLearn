import 'package:elearn_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController{
  const SignInController({required this.context});

  final BuildContext context;

  void handleSignIn(String type){
    try{
      if(type == "email"){
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if(emailAddress.isEmpty){
          //
        }
        if(password.isEmpty){
          //
        }
      }
    } catch(e){
      //
    }
  }
}







