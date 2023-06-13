import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/News Layout/News Cubit/news_cubit.dart';
import '../../mainCubit/main_cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/constraints.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! NewsLoading,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => newsItem(NewsCubit.sports[index], context),
            separatorBuilder: (context, index) => const Divider(
              height: 1,
            ),
            itemCount: NewsCubit.sports.length,
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

}
