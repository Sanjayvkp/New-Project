import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/riverpod_main/future_provider.dart';

class HomePage3 extends ConsumerWidget {
  const HomePage3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('Api integration'),
      ),
      body: ref.watch(future2).when(
        data: (data) {
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: data.length,
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1, color: Colors.white.withOpacity(.50))
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 67, 66, 66),
                      child: Text(
                        data[index].id.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text('Name : ${data[index].username}'),
                    subtitle: Text('Phone No : ${data[index].phone}'),
                  ),
                ),
              ),
            );
          }
        },
        error: (error, stackTrace) {
          return const Text('error');
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
