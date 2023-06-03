abstract class SignUpEvents {
  const SignUpEvents();
}

class UserNameEvents extends SignUpEvents{
  final String userName;
  const UserNameEvents(this.userName);
}

class EmailEvents extends SignUpEvents{
  final String email;
  const EmailEvents(this.email);
}

class PasswordEvents extends SignUpEvents{
  final String password;
  const PasswordEvents(this.password);
}

class ConfirmPasswordEvents extends SignUpEvents{
  final String confirmPassword;
  const ConfirmPasswordEvents(this.confirmPassword);
}