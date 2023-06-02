abstract class SignInEvent{
  const SignInEvent();
}

class EmailEvent extends SignInEvent{
  const EmailEvent(this.email);
  final String email;
}

class PasswordEvent extends SignInEvent{
  const PasswordEvent(this.password);
  final String password;
}