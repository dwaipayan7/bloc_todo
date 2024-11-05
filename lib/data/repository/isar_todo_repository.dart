//Database repository

import 'package:bloc_todo/data/models/isar_todo.dart';
import 'package:bloc_todo/domain/repository/todo_repo.dart';
import 'package:isar/isar.dart';

import '../../domain/model/todo_model.dart';

class IsarTodoRepo implements TodoRepo{

  final Isar db;

  IsarTodoRepo({required this.db});

  //get todos

  @override
  Future<List<Todo>> getTodos() async{
   //fetch from database
    final todos = await db.todoIsars.where().findAll();
    //return as a list of todos
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();

  }

  @override
  Future<void> addTodo(Todo newTodo) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo(Todo todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

}