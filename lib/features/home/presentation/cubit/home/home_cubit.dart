import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_generate/core/usecases/no_params.dart';
import 'package:flutter_generate/core/util/constant.dart';
import 'package:flutter_generate/features/home/domain/entity/todo.dart';
import 'package:flutter_generate/features/home/domain/usecases/get_todos.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetTodo getTodo;
  HomeCubit({required this.getTodo}) : super(const HomeState());

  Future<void> fetchTodoList() async {
    final req = await getTodo(NoParams());
    req.fold(
        (error) => emit(
            state.copyWith(dataStatus: DataStatus.failure, error: error.msg)),
        (todoList) => emit(state.copyWith(
            dataStatus: DataStatus.success, todoList: todoList)));
  }
}
