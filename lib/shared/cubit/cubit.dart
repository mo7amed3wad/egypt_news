import 'package:egypt_news/modules/business/business_Screen.dart';
import 'package:egypt_news/modules/science/Science_screen.dart';
import 'package:egypt_news/modules/setting/setting.dart';
import 'package:egypt_news/modules/sports/Sports_Screen.dart';
import 'package:egypt_news/shared/cubit/states.dart';
import 'package:egypt_news/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<AppStates> {
  NewsCubit() : super(InitialAppState());
  static NewsCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingScreen()
  ];
  int currentindex = 0;
  bool isdark = false;

  List<BottomNavigationBarItem> bottomNavigationItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.work),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Setting',
    ),
  ];

  void changindex(int index) {
    currentindex = index;
    //if (currentindex == 1) getsports();
    //if (currentindex == 2) getscience();

    emit(NewsBottomNavBarState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void getbusinessdata() {
    emit(NewsGetBusinessLoadingState());
    if (business.length == 0) {
      DioHelperr.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apikey': '65c24ae726ee4fbd93e6f967b1519c9d'
      }).then((value) {
        business = value.data['articles'];
        emit(NewsGetBusinessSuccessState());
        print(value.data.toString());
      }).catchError((error) {
        emit(NewsGetBusinessErorState(error.toString()));
        print(error.toString());
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  void getsports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelperr.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': '65c24ae726ee4fbd93e6f967b1519c9d'
      }).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessState());
        print(value.data.toString());
      }).catchError((error) {
        emit(NewsGetSportsErrorState(error.toString()));
        print(error.toString());
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  void getscience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelperr.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apikey': '65c24ae726ee4fbd93e6f967b1519c9d'
      }).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
        print(value.data.toString());
      }).catchError((error) {
        emit(NewsGetScienceErrorState(error.toString()));
        print(error.toString());
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  changetodarkmode() {
    isdark = !isdark;

    emit(Appchangemode());
  }
}
