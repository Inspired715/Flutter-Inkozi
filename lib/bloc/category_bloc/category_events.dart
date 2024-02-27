import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class LoadCategoryEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

///
class UpdateSelectedCategoryEvent extends CategoryEvent {
  final String? selectedCategoryId;

  UpdateSelectedCategoryEvent(this.selectedCategoryId);

  @override
  List<Object?> get props => [selectedCategoryId];
}