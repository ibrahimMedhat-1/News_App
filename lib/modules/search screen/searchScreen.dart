import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/layout/News%20Layout/News%20Cubit/news_cubit.dart';
import 'package:untitled6/shared/components/components.dart';

import '../../mainCubit/main_cubit.dart';
import '../../shared/constraints.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value){
                          NewsCubit.get(context).getSearch(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ConditionalBuilder(
                          condition:state is! NewsLoading,
                          builder:(context) => ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                newsItem(NewsCubit.search[index], context),
                            separatorBuilder: (context, index) => const Divider(
                              height: 1,
                            ),
                            itemCount: NewsCubit.search.length,
                          ),
                          fallback:(context) => const Center(child: CircularProgressIndicator()),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        );
      },
    );
  }

}
