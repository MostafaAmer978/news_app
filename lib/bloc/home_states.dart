abstract class HomeStates {}

class InitialState extends HomeStates {}

class HomeGetSourcesLoadingState extends HomeStates {}

class HomeGetSourcesErrorState extends HomeStates {
  String errorMessage;
  HomeGetSourcesErrorState(this.errorMessage);
}

class HomeGetSourcesSuccessState extends HomeStates {}

class HomeGetNewsLoadingState extends HomeStates {

}

class HomeGetNewsErrorState extends HomeStates {
  String errorMessage;
  HomeGetNewsErrorState(this.errorMessage);
}

class HomeGetNewsSuccessState extends HomeStates {
}

class ChangeSelectedSource extends HomeStates{}
