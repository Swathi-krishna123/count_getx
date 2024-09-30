import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/count_controller.dart';

class Secondpage extends StatelessWidget {
  final CountController ctrl = Get.put(CountController());
  Secondpage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('count  -  ${ctrl.count}')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  ctrl.decrement();
                },
                child: const Text('decrement')),
            
          ],
        ),
      ),
    );
  }
}
