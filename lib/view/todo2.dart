import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/model/todo_model.dart';
import 'package:state_managment/riverpod_main/todonotifier.dart';

class TodoNotifier extends ConsumerWidget {
  TodoNotifier({super.key});
  final TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('ToDo App'),
        toolbarHeight: 130,
      ),
      body: ListView.builder(
        itemCount: ref.watch(todoProvider).length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: ref.watch(todoProvider)[index].isChanged,
              onChanged: (value) {
                ref.read(todoProvider.notifier).updateTask(
                    index,
                    ModelTodo(
                        isChanged: value!,
                        task: ref.watch(todoProvider)[index].task));
              },
            ),
            title: Text(
              ref.watch(todoProvider)[index].task,
              style: const TextStyle(fontSize: 25),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Edit Your ToDo'),
                            content: TextField(
                              controller: myController,
                              decoration: InputDecoration(
                                  hintText: 'Write Here...',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            actions: [
                              FloatingActionButton(
                                onPressed: () {
                                  ref.read(todoProvider.notifier).updateTask(
                                      index,
                                      ModelTodo(
                                          isChanged: false,
                                          task: myController.text));
                                },
                                child: const Icon(Icons.edit),
                              )
                            ],
                          );
                        },
                      );
                      myController.text = ref.watch(todoProvider)[index].task;
                    },
                    icon: const Icon(Icons.edit_document)),
                IconButton(
                    onPressed: () {
                      ref.read(todoProvider.notifier).deleteTask(index);
                    },
                    icon: const Icon(Icons.delete_outline))
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 74, 71, 71),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add To Dos'),
                content: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                      hintText: 'Write your ToDos here..',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        ref.read(todoProvider.notifier).addTodo(ModelTodo(
                            isChanged: false, task: myController.text));
                        // log(ref.read(todoProvider).toString());
                      },
                      icon: const Icon(Icons.add))
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
