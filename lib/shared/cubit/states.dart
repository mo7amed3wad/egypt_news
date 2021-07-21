abstract class AppStates {}

class InitialAppState extends AppStates {}

class NewsBottomNavBarState extends AppStates {}

class NewsGetBusinessLoadingState extends AppStates {}

class NewsGetBusinessSuccessState extends AppStates {}

class NewsGetBusinessErorState extends AppStates {
  final String error;
  NewsGetBusinessErorState(this.error);
}

class NewsGetSportsLoadingState extends AppStates {}

class NewsGetSportsSuccessState extends AppStates {}

class NewsGetSportsErrorState extends AppStates {
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends AppStates {}

class NewsGetScienceSuccessState extends AppStates {}

class NewsGetScienceErrorState extends AppStates {
  final String error;

  NewsGetScienceErrorState(this.error);
}

class Appchangemode extends AppStates {}
