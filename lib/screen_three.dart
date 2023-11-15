import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_/counter_controller/counter_controller.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  CounterController controller = Get.put(CounterController());
  ImagePickerController imageController = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Three"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.fruitList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      onTap: () {
                        if (controller.tempFruitList
                            .contains(controller.fruitList[index].toString())) {
                          controller.removeFavouriteList(
                              controller.fruitList[index].toString());
                        } else {
                          controller.addFavouriteList(
                              controller.fruitList[index].toString());
                        }
                      },
                      title: Text(controller.fruitList[index].toString()),
                      trailing: Obx(
                        () => Icon(Icons.favorite,
                            color: controller.tempFruitList.contains(
                                    controller.fruitList[index].toString())
                                ? Colors.red
                                : Colors.white),
                      )),
                );
              },
            ),
          ),
          Obx(
            () => Column(
              children: [
                Center(
                  child: CircleAvatar(
                      radius: 80,
                      backgroundImage: imageController.imagePath.isNotEmpty
                          ? FileImage(
                              File(imageController.imagePath.toString()),
                            )
                          : null),
                ),
                SizedBox(
                  height: Get.height * .10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        imageController.getImage();
                      },
                      child: Text("Pick Image"),
                    ),
                    TextButton(
                      onPressed: () {
                        imageController.getImagefromCamera();
                      },
                      child: Text("Click Image"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Move to previous screen")),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
