class SignUpStates {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpStates(
      this.userName, this.email, this.password, this.confirmPassword);

  SignUpStates copyWith(
      {String? userName,
      String? email,
      String? password,
      String? confirmPassword}) {
    return SignUpStates(
      userName ?? this.userName,
      email ?? this.email,
      password ?? this.password,
      confirmPassword ?? this.confirmPassword,
    );
  }
}
