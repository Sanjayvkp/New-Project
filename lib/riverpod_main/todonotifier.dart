import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/model/todo_model.dart';

class ToDo extends StateNotifier<List<ModelTodo>> {
  ToDo() : super([]);

  void addTodo(ModelTodo task) {
    state = [
      task,
      ...state,
    ];
  }

  void deleteTask(int index) {
    state = [
      for (ModelTodo myController in state)
        if (myController != state[index]) myController
    ];
  }

  void updateTask(int index, ModelTodo updatedTask) {
    state = [
      for (ModelTodo task in state)
        if (task != state[index]) task else updatedTask
    ];
  }
}

final todoProvider = StateNotifierProvider<ToDo, List<ModelTodo>>((ref) {
  return ToDo();
});
