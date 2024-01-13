import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generate/core/usecases/no_params.dart';
import 'package:flutter_generate/core/constants/constant.dart';
import 'package:flutter_generate/features/home/domain/entity/todo.dart';
import 'package:flutter_generate/features/home/domain/usecases/get_todos_usecase.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetTodoUsecase _getTodoUsecase;
  HomeCubit(this._getTodoUsecase) : super(const HomeState());

  Future<void> fetchTodoList() async {
    final req = await _getTodoUsecase(NoParams());
    req.fold(
        (error) => emit(
            state.copyWith(dataStatus: DataStatus.failure, error: error.msg)),
        (todoList) => emit(state.copyWith(
            dataStatus: DataStatus.success, todoList: todoList)));
  }
}
