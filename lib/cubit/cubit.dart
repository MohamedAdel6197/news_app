import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
  ];

  List<Widget> screens = [
    const BusinessNews(),
    const SportsNews(),
    const ScienceNews(),
  ];

  int currentPage = 0;
  void changeCerrentPageIndex({required int index}) {
    currentPage = index;
    emit(ChangeCurrentIndexState());
  }

  bool isDark = false;
  void changeDarkModeTheme({bool? savedBool}) {
    if (savedBool != null) {
      isDark = savedBool;
      emit(ChangeDarkModeState());
    } else {
      isDark = !isDark;
      CacheHelper.setBool(key: "isDark", value: isDark).then((value) {
        emit(ChangeDarkModeState());
      });
    }
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(LoadingBusinessState());
    DioHelper.getNewsData(
      path: 'v2/top-headlines',
      query: {
        "country": 'us',
        "category": 'business',
        "apiKey": '7e93f02ba64347de9269a419dc6149e0'
      },
    ).then((value) {
      business = value.data['articles'];
      emit(GetSuccessBusinessState());
      // ignore: avoid_print
      print("${business.length} \n");
    }).catchError((onError) {
      // ignore: avoid_print
      print("onError , $onError");
      emit(GetErrorBusinessState("onError"));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(LoadingSportsState());
    DioHelper.getNewsData(
      path: 'v2/top-headlines',
      query: {
        "country": 'us',
        "category": 'sport',
        "apiKey": '7e93f02ba64347de9269a419dc6149e0'
      },
    ).then((value) {
      sports = value.data['articles'];
      emit(GetSuccessSportsState());
      // ignore: avoid_print
      print("${sports.length} \n");
    }).catchError((onError) {
      // ignore: avoid_print
      print("onError , $onError");
      emit(GetErrorSportsState("onError"));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(LoadingScienceState());
    DioHelper.getNewsData(
      path: 'v2/top-headlines',
      query: {
        "country": 'us',
        "category": 'science',
        "apiKey": '7e93f02ba64347de9269a419dc6149e0'
      },
    ).then((value) {
      science = value.data['articles'];
      emit(GetSuccessScienceState());
      // ignore: avoid_print
      print("${science.length} \n");
    }).catchError((onError) {
      // ignore: avoid_print
      print("onError , $onError");
      emit(GetErrorScienceState("onError"));
    });
  }
}
