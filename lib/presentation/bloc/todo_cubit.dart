import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/model/todo_model.dart';
import '../../domain/repository/todo_repo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  // Reference to the todo repository
  final TodoRepo todoRepo;

  // Constructor initializes the cubit with an initial state
  TodoCubit(this.todoRepo) : super(TodoInitial()) {
    loadTodos();
  }

  // L O A D
  Future<void> loadTodos() async {
    emit(TodoLoading()); // Emit loading state

    try {
      // Fetch list of todos from repo
      final todoList = await todoRepo.getTodos();
      emit(TodoLoaded(todoList)); // Emit loaded state with the fetched todos
    } catch (e) {
      emit(TodoError("Failed to load todos: $e")); // Emit error state on failure
    }
  }

  // A D D
  Future<void> addTodo(String text) async {
    emit(TodoAdding()); // Emit adding state

    try {
      // Create a new todo with unique ID
      final newTodo = Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        text: text,
      );

      // Save the new todo to repo
      await todoRepo.addTodo(newTodo);

      // Reload todos after adding
      loadTodos();
    } catch (e) {
      emit(TodoError("Failed to add todo: $e")); // Emit error state on failure
    }
  }

  // D E L E T E
  Future<void> deleteTodo(Todo todo) async {
    emit(TodoDeleting()); // Emit deleting state

    try {
      // Delete the provided todo from repo
      await todoRepo.deleteTodo(todo);

      // Reload todos after deletion
      loadTodos();
    } catch (e) {
      emit(TodoError("Failed to delete todo: $e")); // Emit error state on failure
    }
  }

  // T O G G L E
  Future<void> toggleCompletion(Todo todo) async {
    emit(TodoToggling()); // Emit toggling state

    try {
      // Toggle the completion status of the provided todo
      final updatedTodo = todo.toggleCompletion();

      // Update the todo in repo with the new completion status
      await todoRepo.updateTodo(updatedTodo);

      // Reload todos after toggling completion
      loadTodos();
    } catch (e) {
      emit(TodoError("Failed to toggle completion: $e")); // Emit error state on failure
    }
  }
}
