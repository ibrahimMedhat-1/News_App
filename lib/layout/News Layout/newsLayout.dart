import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/mainCubit/main_cubit.dart';
import 'package:untitled6/modules/search%20screen/searchScreen.dart';

import '../../modules/businessScreen/businessScreen.dart';
import '../../modules/scienceScreen/ScienceScreen.dart';
import '../../modules/sportsScreen/sportsScreen.dart';

import 'News Cubit/news_cubit.dart';


// ignore: must_be_immutable
class NewsLayout extends StatelessWidget {
  NewsLayout({Key? key}) : super(key: key);
  List<Widget> screens = const[
    Business(),
    Science(),
    Sports(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'News App',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            actions: [
              IconButton(
                onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (builder)=>const SearchScreen()));
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                  onPressed: () {
                    NewsCubit.get(context).changeMode(context: context);
                  },
                  icon: const Icon(Icons.brightness_2))
            ],
          ),
          body: screens[NewsCubit.get(context).index??0],
          // ignore: prefer_const_literals_to_create_immutables
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: NewsCubit.get(context).index??0,
            onTap: (index) {
              {
                NewsCubit.get(context).changeIndex(index);
              }
            },
            items: NewsCubit.get(context).navBarItems.toList(),
          ),
        );
      },
    );
  }
}

