import 'package:equatable/equatable.dart';

class SignInState  {
  const SignInState({this.email = '', this.password = ''});

  final String email;
  final String password;

  SignInState copyWith({String? email, String? password}) {
    return SignInState(
        email: email ?? this.email, password: password ?? this.password);
  }

  // @override
  // // TODO: implement props
  // List<Object?> get props => throw UnimplementedError();
}
