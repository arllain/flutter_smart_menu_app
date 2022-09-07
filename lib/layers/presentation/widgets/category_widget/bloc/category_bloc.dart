import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:smart_menu_app/core/usecases/usecase.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/layers/domain/usecases/category/get_all_categories/get_all_categories_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  CategoryBloc({
    required this.getAllCategoriesUseCase,
  }) : super(const CategoryState()) {
    on<GetAllCategoriesEvent>(_mapGetCategoriesEventToState);
    on<SelectCategoryEvent>(_mapSelectCategoryEventToState);
  }

  void _mapGetCategoriesEventToState(
      GetAllCategoriesEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    final failureOrCategoryList = await getAllCategoriesUseCase(NoParams());

    failureOrCategoryList?.fold(
      (failure) {
        emit(state.copyWith(
            status: CategoryStatus.error,
            message: _mapFailureToMessage(failure)));
      },
      (categoryList) {
        emit(state.copyWith(
            status: CategoryStatus.success, categories: categoryList));
        emit(state.copyWith(
            status: CategoryStatus.selected, idSelected: categoryList[0].id));
      },
    );
  }

  void _mapSelectCategoryEventToState(
      SelectCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(
      state.copyWith(
        status: CategoryStatus.selected,
        idSelected: event.idSelected,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected error';
    }
  }
}
