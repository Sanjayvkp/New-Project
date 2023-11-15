import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/riverpod_main/consumer.dart';

class DecrementCounter extends ConsumerWidget {
  const DecrementCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Decrement counter'),
      ),
      body: Center(
        child: Text(
          ref.watch(counterApp).toString(),
          style: const TextStyle(fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () {
          ref.read(counterApp.notifier).state--;
        },
        label: const Text('Substract'),
      ),
    );
  }
}
