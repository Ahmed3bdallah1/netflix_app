abstract class SaveState {}

class SaveInitial extends SaveState {}

class SaveFailState extends SaveState {
  final String error;

  SaveFailState(this.error);
}

class SaveSuccessState extends SaveState {}
