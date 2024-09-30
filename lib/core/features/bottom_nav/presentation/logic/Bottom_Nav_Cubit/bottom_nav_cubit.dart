import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/pages/jobs_list_home_page.dart';

import 'bottom_nav_cubit_state.dart';

class BottomNavCubit extends Cubit<BottomNavCubitState> {
  BottomNavCubit() : super(BottomNavInitialState());

  static BottomNavCubit get(BuildContext context) => BlocProvider.of(context);
  int selectedIndex = 0;
  int indexedStackIndex = 0;

  /// Pages
  List<Widget> widgetOptions = <Widget>[
    const JobsListHomePage(),
    Container(color: Colors.purple),
    Container(color: Colors.red),
  ];

  void selectItem(int index) {
    selectedIndex = index;
    indexedStackIndex = 0;
    emit(BottomNavChangeState());
  }

  void setSelectedIndexedStackIndex(int index) {
    indexedStackIndex = index;
    emit(BottomNavChangeState());
  }
}
