
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/CategoryModel.dart';


@immutable
abstract class CategoryState extends Equatable {}

class CategoryInitialState extends CategoryState {
  @override
  List<Object?> get props => [];
}

//data loading state
class CategoryLoadingState extends CategoryState {
  @override
  List<Object?> get props => [];
}


//data loaded state 
class CategoryLoadedState extends CategoryState {
  final List<CategoryModel> categorys;
  final String? selectedCategoryId;

  CategoryLoadedState(this.categorys, {this.selectedCategoryId});

  @override
  List<Object?> get props => [categorys, selectedCategoryId];

  // Define the copyWith method
  CategoryLoadedState copyWith({List<CategoryModel>? categorys, String? selectedCategoryId}) {
    return CategoryLoadedState(
      categorys ?? this.categorys,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
    );
  }
}



//data loading error state 
class CategoryErrorState extends CategoryState {
  final String error;
  CategoryErrorState(this.error);
  @override
  List<Object?> get props => [error];
}





