import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generate/core/DI/service_locator.dart';
import 'package:flutter_generate/core/constants/constant.dart';
import 'package:flutter_generate/core/routers/app_router.dart';
import 'package:flutter_generate/features/home/domain/entity/todo.dart';
import 'package:flutter_generate/features/home/presentation/cubit/home/home_cubit.dart';

@RoutePage()
class MyHomePage extends StatelessWidget implements AutoRouteWrapper {
  const MyHomePage({super.key});
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..fetchTodoList(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.jpeg",
              width: 30,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text('Todo list'),
          ],
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.dataStatus == DataStatus.loading ||
              state.dataStatus == DataStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.dataStatus == DataStatus.success) {
            if (state.todoList.isEmpty) {
              return const Center(
                child: Text("Your todo list empty"),
              );
            }
            return ListView.separated(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                Todo todo = state.todoList[index];
                return ListTile(
                  title: Text(todo.title ?? ""),
                  subtitle: Text(todo.userId.toString()),
                  trailing: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: todo.completed == true ? Colors.green : Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  onTap: () {
                    context.pushRoute(const DetailRoute());
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          } else {
            return Center(
              child: Text(state.error ?? "Something wrong!!!"),
            );
          }
        },
      ),
    );
  }
}
