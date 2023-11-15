import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/riverpod_main/future_provider.dart';


class HomePage2 extends ConsumerWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API integration'),
      ),
      body: ref.watch(future).when(
            data: (data) => ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: data!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(data[index].title),
                subtitle: Text(data[index].body),
                leading: CircleAvatar(child: Text("${data[index].id}")),
              ),
            ),
            error: (error, stackTrace) => const Center(
              child: Text('Something went wrong try again'),
            ),
            loading: () {
              return const CircularProgressIndicator();
            },
          ),
    );
  }
}
