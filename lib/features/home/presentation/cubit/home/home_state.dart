part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.todoList = const [],
    this.dataStatus = DataStatus.initial,
    this.error,
  });

  final List<Todo> todoList;
  final DataStatus dataStatus;
  final String? error;

  @override
  List<Object> get props => [todoList, dataStatus];

  HomeState copyWith({
    List<Todo>? todoList,
    DataStatus? dataStatus,
    String? error,
  }) {
    return HomeState(
      dataStatus: dataStatus ?? this.dataStatus,
      error: error ?? this.error,
      todoList: todoList ?? this.todoList,
    );
  }
}
