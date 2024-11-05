
import 'package:bloc_todo/domain/model/todo_model.dart';
import 'package:isar/isar.dart';
//to generate
part 'isar_todo.g.dart';

@collection
class TodoIsar{
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  //convert isar object -> pure todo object to use in my app
  Todo toDomain(){
    return Todo(
        id: id,
        text: text,
      isCompleted: isCompleted
    );
  }

//convert isar object -> pure todo object to store in my app

  static TodoIsar formDomain(Todo todo){
    return TodoIsar()
        ..id = todo.id
        ..text = todo.text
        ..isCompleted = todo.isCompleted;
  }

}