import 'package:bloc_todo/domain/model/todo_model.dart';
import 'package:bloc_todo/presentation/bloc/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();

    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              todoCubit.addTodo(textController.text);
              Navigator.pop(context);
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddTodoBox(context);
          },
          child: Icon(Icons.add),
        ),
        body: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            if (state is TodoLoaded) {
              // Access the list of todos from the loaded state
              final todos = state.todos;
      
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return ListTile(
                    title: Text(todo.text),
                    trailing: IconButton(
                      icon: Icon(
                        todo.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                      ),
                      onPressed: () {
                        context.read<TodoCubit>().toggleCompletion(todo);
                      },
                    ),
                    onLongPress: () {
                      context.read<TodoCubit>().deleteTodo(todo);
                    },
                  );
                },
              );
            } else if (state is TodoLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(child: Text("Something went wrong!"));
            }
          },
        ),
      ),
    );
  }
}
