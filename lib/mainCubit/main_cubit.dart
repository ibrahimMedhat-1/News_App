import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/layout/News%20Layout/News%20Cubit/news_cubit.dart';
import 'package:untitled6/shared/network/local/cacheHelper.dart';

import '../shared/constraints.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);

}
