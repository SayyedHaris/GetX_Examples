// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_/counter_controller/counter_controller.dart';
// import 'package:get_x_/screen_two.dart';

class ScreenOne extends StatefulWidget {
  // var name;
  const ScreenOne({super.key});
  // this.name

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  CounterController _controller = Get.put(CounterController());

  // int counter = 0;
  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen One"),
        // + Get.arguments[0]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return Text(_controller.counter.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold));
            }),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Get.toNamed('/screenTwo');
                  // Get.to(ScreenTwo());
                },
                child: const Text("Move to Second Screen")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _controller.incrementCounter();
        },
      ),
    );
  }
}
