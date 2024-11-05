part of 'todo_cubit.dart';


// Base state class
abstract class TodoState {}

// Initial state when nothing has loaded yet
class TodoInitial extends TodoState {}

// State when the todos are being loaded
class TodoLoading extends TodoState {}

// State when the todos are successfully loaded
class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos);
}

// State for when a todo is being added
class TodoAdding extends TodoState {}

// State when a todo is successfully added
class TodoAdded extends TodoState {
  final List<Todo> todos;

  TodoAdded(this.todos);
}

// State for when a todo is being deleted
class TodoDeleting extends TodoState {}

// State when a todo is successfully deleted
class TodoDeleted extends TodoState {
  final List<Todo> todos;

  TodoDeleted(this.todos);
}

// State for when a todo's completion status is being toggled
class TodoToggling extends TodoState {}

// State when a todo's completion status is successfully toggled
class TodoToggled extends TodoState {
  final List<Todo> todos;

  TodoToggled(this.todos);
}

// Error state
class TodoError extends TodoState {
  final String message;

  TodoError(this.message);
}