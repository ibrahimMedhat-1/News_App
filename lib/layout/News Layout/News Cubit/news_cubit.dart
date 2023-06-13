

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/constraints.dart';
import '../../../shared/network/local/cacheHelper.dart';
import '../../../shared/network/remote/dioHelper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);
  int? index;

  List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(
      label: '',
      backgroundColor: Colors.red,
      icon: Icon(Icons.newspaper_rounded),
    ),
    BottomNavigationBarItem(
      label: '',
      backgroundColor: Colors.red,
      icon: Icon(Icons.business),
    ),
    BottomNavigationBarItem(
      label: '',
      backgroundColor: Colors.red,
      icon: Icon(Icons.sports),
    ),
  ];
  static List<dynamic> articles = [];
  static List<dynamic> sports = [];
  static List<dynamic> science = [];
  static List<dynamic> search = [];

  void getArticles() async {
      emit(NewsLoading());
    if (articles.isEmpty) {
      await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          // country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
          'country': 'eg',
          'category': 'business',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        articles = value.data['articles'];
        emit(NewsData());
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }else {
      emit(NewsData());
    }
  }

  void getSports() async {
    emit(NewsLoading());
   if(sports.isEmpty) {
      await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          // country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
          'country': 'eg',
          'category': 'sports',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        sports = value.data['articles'];
        emit(NewsData());
      }).catchError((error) {
        debugPrint(error.toString());

      });
    }
   else {
      emit(NewsData());
    }
  }

  void getScience() async {
    emit(NewsLoading());
    if(sports.isEmpty){
      await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          // country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
          'country': 'eg',
          'category': 'science',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        science = value.data['articles'];
        emit(NewsData());
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }
    else{
      emit(NewsData());
    }
  }

  void getSearch(String value) async {
    emit(NewsLoading());

      await DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': value,
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        search = value.data['articles'];
        emit(NewsData());
      }).catchError((error) {
        debugPrint(error.toString());
      });


  }

  changeIndex(index) {
    emit(NewsLoading());
    this.index = index;
    emit(NewsInitial());
  }
bool isDark = false;
  changeMode({fromShared
    ,required context}) async{
    if(fromShared!=null){
      isDark=fromShared;
      emit(NewsChangeToLightThemeMode());
      print(isDark);
    }
    else{
      isDark = !isDark;
      print(isDark);
      emit(NewsChangeToDarkThemeMode());
      await CacheHelper.setBool(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeToDarkThemeMode());
      });
    }
  }
}
