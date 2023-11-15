import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  TextEditingController myController = TextEditingController();
  List things = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 39, 39),
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 100,
        title: const Text(
          'ToDo App',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: things.length,
            itemBuilder: (context, index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${index + 1}',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.50), fontSize: 15),
                      ),
                      Text(
                        things[index],
                        style: TextStyle(
                            color: Colors.white.withOpacity(.50),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              things.removeAt(index);
                            });
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 18,
                          ))
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 370,
                        child: TextField(
                          controller: myController,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Enter your Tasks..',
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 161, 160, 160)),
                              fillColor: const Color.fromARGB(255, 98, 97, 97),
                              filled: true),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 113, 0, 0)),
                              onPressed: () {
                                setState(() {
                                  things.add(myController.text);
                                  Navigator.pop(context);
                                });
                                myController.clear();
                              },
                              child: Text('Add')),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 113, 0, 0)),
                              onPressed: () {
                                setState(() {
                                  things.clear();
                                });
                              },
                              child: Text('Clear All')),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
          label: const Text(
            'Click Me!!',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
