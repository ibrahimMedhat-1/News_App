import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/layout/News%20Layout/News%20Cubit/news_cubit.dart';
import 'package:untitled6/mainCubit/main_cubit.dart';
import 'package:untitled6/shared/constraints.dart';
import 'package:untitled6/shared/network/local/cacheHelper.dart';
import 'package:untitled6/shared/network/remote/dioHelper.dart';

import 'layout/News Layout/newsLayout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  isDark = await CacheHelper.getBool(key: 'isDark') ?? false;
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp(this.isDark, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => NewsCubit()
            ..changeMode(fromShared: isDark, context: context)
            ..getArticles()
            ..getScience()
            ..getSports(),
        ),
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.deepOrange,
              primarySwatch: Colors.deepOrange,
              canvasColor: Colors.white,
              textTheme: TextTheme(
                titleMedium: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                bodyLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                bodyMedium: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.black87,
                  size: 35,
                ),
                backgroundColor: Colors.white,
                // titleTextStyle: TextStyle(
                //   color: Colors.black87,
                //   fontWeight: FontWeight.bold,
                //   fontSize: 25,
                // ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.grey[100],
                selectedItemColor: Colors.deepOrange,
              ),
            ),
            darkTheme: ThemeData(
              primaryColor: Colors.deepOrange,
              primarySwatch: Colors.deepOrange,
              canvasColor: Colors.black,
              textTheme: TextTheme(
                titleMedium: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                bodyLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                bodyMedium: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.black,
                // titleTextStyle: TextStyle(
                //   color: Colors.white,
                //   fontWeight: FontWeight.bold,
                //   fontSize: 25,
                // ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
                unselectedIconTheme: IconThemeData(color: Colors.grey),
                selectedItemColor: Colors.deepOrange,
              ),
              iconTheme: const IconThemeData(size: 35, color: Colors.black),
            ),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            // themeMode: ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('onClose -- bloc: ${bloc.runtimeType}');
  }
}
