class AppStates{
  AppStates({required this.counter});
  int counter;
}

class InitStates extends AppStates{
  InitStates(): super(counter: 5);
}