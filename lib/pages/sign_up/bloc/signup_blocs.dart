import 'package:elearn_app/pages/sign_up/bloc/signup_events.dart';
import 'package:elearn_app/pages/sign_up/bloc/signup_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocs extends Bloc<SignUpEvents, SignUpStates> {
  SignUpBlocs():super(const SignUpStates()) {
    on<UserNameEvents>(_userNameEvent);
    on<EmailEvents>(_emailEvent);
    on<PasswordEvents>(_passwordEvent);
    on<ConfirmPasswordEvents>(_confirmPasswordEvent);
  }
  void _userNameEvent(UserNameEvents event, Emitter<SignUpStates> emit){
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvents event, Emitter<SignUpStates> emit){
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvents event, Emitter<SignUpStates> emit){
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(ConfirmPasswordEvents event, Emitter<SignUpStates> emit){
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}