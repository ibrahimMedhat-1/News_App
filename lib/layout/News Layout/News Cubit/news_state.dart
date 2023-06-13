part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsData extends NewsState {}

class NewsChangeToLightThemeMode extends NewsState {}

class NewsChangeToDarkThemeMode extends NewsState {}

