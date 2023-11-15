import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/riverpod_main/consumer.dart';
import 'package:state_managment/view/decrement.dart';

class IncrementCounter extends ConsumerWidget {
  const IncrementCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.refresh(counterApp).toString();
            },
            icon: Icon(Icons.refresh)),
        backgroundColor: Colors.black,
        title: const Text('Increment Counter'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DecrementCounter(),
                    ));
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ref.watch(counterApp).toString(),
                  style: const TextStyle(fontSize: 50),
                ),
                child!
              ],
            );
          },
          child: Text('Count'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            ref.read(counterApp.notifier).state++;
          },
          label: const Text('Add')),
    );
  }
}
