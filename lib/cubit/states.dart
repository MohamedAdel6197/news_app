abstract class AppStates {}

class InitialState implements AppStates {}

class ChangeCurrentIndexState implements AppStates {}

class LoadingBusinessState implements AppStates {}

class GetSuccessBusinessState implements AppStates {}

class GetErrorBusinessState implements AppStates {
  String error;
  GetErrorBusinessState(this.error);
}

class LoadingSportsState implements AppStates {}

class GetSuccessSportsState implements AppStates {}

class GetErrorSportsState implements AppStates {
  String error;
  GetErrorSportsState(this.error);
}

class LoadingScienceState implements AppStates {}

class GetSuccessScienceState implements AppStates {}

class GetErrorScienceState implements AppStates {
  String error;
  GetErrorScienceState(this.error);
}

class LoadingSearchState implements AppStates {}

class GetSuccessSearchState implements AppStates {}

class GetErrorSearchState implements AppStates {
  String error;
  GetErrorSearchState(this.error);
}

class ChangeDarkModeState implements AppStates {}
