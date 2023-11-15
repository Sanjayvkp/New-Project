import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncrementDemo extends StateNotifier<int> {
  IncrementDemo() : super(0);

  void addFunction() {
    state++;
  }
}

final addProvider = StateNotifierProvider<IncrementDemo, int>((ref) {
  return IncrementDemo();
});
