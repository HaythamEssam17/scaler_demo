import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_filter_states.dart';

class AllFilterCubit extends Cubit<AllFilterCubitState> {
  AllFilterCubit() : super(FilterStateInitial());

  static AllFilterCubit get(BuildContext context) => BlocProvider.of(context);

  ///list of all model data
  List<dynamic> listOfModels = [];

  ///list of all model data temp  (need to search in model)
  List<dynamic> listOfModelsTemp = [];

  ///model item selected
  dynamic modelItem;

  ///list of model item selected
  List<dynamic> listOfSelectedModelItem = [];

  void setModelSingleSelect(dynamic model) {
    modelItem = model;
    emit(FilterSetItemState());
  }

  ///set list data
  void setList(List<dynamic> list) {
    listOfModels = list;
    listOfModelsTemp = list;

    emit(FilterSetListState());
  }

  void setMultiModelData(List<dynamic> list) {
    if (list.isNotEmpty) {
      listOfSelectedModelItem = list;
    }

    emit(FilterSetListState());
  }

  ///search in list by name
  void searchInList(String value) {
    listOfModelsTemp =
        listOfModels.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
    emit(FilterSearchState());
  }

  ///check which model is selected
  bool isModelSelected(dynamic model, bool isMultiSelect) {
    if (isMultiSelect) {
      return listOfSelectedModelItem.contains(model);
    }
    if (modelItem == null) {
      return false;
    } else {
      return modelItem.id == model.id;
    }
  }

  ///set model in multi select
  void setModelMultiSelect(dynamic model) {
    ///check if model list is empty add new model
    if (listOfSelectedModelItem.isEmpty) {
      listOfSelectedModelItem.add(model);
    } else {
      /// if the model is in the list remove or if not add new item to list
      if (listOfSelectedModelItem.contains(model)) {
        listOfSelectedModelItem.remove(model);
      } else {
        listOfSelectedModelItem.add(model);
      }
    }
    emit(FilterSetItemState());
  }
}
