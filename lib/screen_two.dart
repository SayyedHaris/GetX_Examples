import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_/counter_controller/counter_controller.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  //very imp .. it injects that class here. i.e CounterCountroller class by Get.Put method.
  CounterController countercontroller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Two"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Obx(
                () => Container(
                  height: 200,
                  width: 200,
                  color:
                      Colors.red.withOpacity(countercontroller.opacity.value),
                  child: Center(
                    child: Text("Harry",
                        style: TextStyle(
                            color: Colors.black
                                .withOpacity(countercontroller.opacity.value))),
                  ),
                ),
              ),
              Obx(
                () => Slider(
                  value: countercontroller.opacity.value,
                  onChanged: (value) => countercontroller.setOpacity(value),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notifications"),
                  Obx(
                    () => Switch(
                      value: countercontroller.notification.value,
                      onChanged: (value) {
                        countercontroller.setNotification(value);
                      },
                    ),
                  )
                ],
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed("/screenThree");
                  },
                  child: const Text("Move to Third Screen")),
              TextButton(
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                  child: const Text("Move back to Home Screen")),
            ],
          ),
        ),
      ),
    );
  }
}
