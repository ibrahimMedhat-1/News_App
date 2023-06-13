// ignore_for_file: file_names
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/mainCubit/main_cubit.dart';
import 'package:untitled6/shared/constraints.dart';
import '../../layout/News Layout/News Cubit/news_cubit.dart';
import '../../shared/components/components.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! NewsLoading,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>newsItem(NewsCubit.articles[index], context),
            separatorBuilder: (context, index) => const Divider(
              height: 1,
            ),
            itemCount: NewsCubit.articles.length,
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
