part of 'home_cubit.dart';
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(DataStatus.initial)
    DataStatus dataStatus,
    String? error,
    @Default([])
    List<Todo> todoList,
  }) = _HomeState;

}