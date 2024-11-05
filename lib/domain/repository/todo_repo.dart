import 'package:bloc_todo/domain/model/todo_model.dart';

abstract class TodoRepo {
  //get List of todos

  Future<List<Todo>> getTodos();

  //add a new todo
  Future<void> addTodo(Todo newTodo);

  //update and existing todo

  Future<void> updateTodo(Todo todo);

  //delete a todo
  Future<void> deleteTodo(Todo todo);
}
