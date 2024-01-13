import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generate/core/util/app_navigator.dart';
import 'package:flutter_generate/core/util/constant.dart';
import 'package:flutter_generate/core/util/router.dart';
import 'package:flutter_generate/features/home/domain/entity/todo.dart';
import 'package:flutter_generate/features/home/presentation/cubit/home/home_cubit.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


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
                    AppNavigator.navigateTo(AppRoute.detailRoute);
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
