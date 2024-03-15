import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatitapp/domain/entities/cats.dart';
import 'package:gatitapp/domain/use%20case/fetch_cats_use_case.dart';
import 'package:gatitapp/presentation/cat_list/cubit/cats_status.dart';

part 'cats_state.dart';

class CatsCubit extends Cubit<CatsState> {
  CatsCubit({required FetchCatsUseCase fetchCatsUseCase})
      : _fetchCatsUseCase = fetchCatsUseCase,
        super(CatsState.initialState());

  final FetchCatsUseCase _fetchCatsUseCase;

  Future<void> fetchData() async {
    emit(
      state.copyWith(
        status: CatsStatus.loading,
      ),
    );

    final responseBox = await _fetchCatsUseCase(unit);

    final response = responseBox.fold(
      (exception) => exception,
      (cats) => cats,
    );

    if (responseBox.isLeft()) {
      emit(
        state.copyWith(
          status: CatsStatus.error,
          errorMessage: (response as Exception).toString(),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: CatsStatus.loaded,
        cats: response as List<Cat>,
      ),
    );
  }

  Future<void> searchCat(String name) async {
    emit(
      state.copyWith(
        status: CatsStatus.loading,
      ),
    );

    final newList = state.cats
        ?.where((cat){
          final catName = cat.name.toLowerCase();
         return catName.contains(name.toLowerCase());
        })
        .toList();
    emit(state.copyWith(
      status: CatsStatus.loaded,
      cats: newList,
    ));
  }
}
