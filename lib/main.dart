import 'package:bloc_todo/domain/repository/todo_repo.dart';
import 'package:bloc_todo/presentation/bloc/todo_cubit.dart';
import 'package:bloc_todo/presentation/page/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(context.read<TodoRepo>()),
      child: MaterialApp(
        title: 'TODO BLOC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: TodoPage(),
      ),
    );
  }
}

