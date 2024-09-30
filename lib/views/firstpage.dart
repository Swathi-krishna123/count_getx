import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/count_controller.dart';
import 'package:task/views/secondpage.dart';

class Firstpage extends StatelessWidget {
  // final controller = Get.put(CountController());
  final CountController controller = Get.put(CountController());
  Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GetBuilder<CountController>(
            //   builder: (context) {
            //     return Text('count  -  ${controller.count}');
            //   }
            // ),
            Obx(() => Text('count  -  ${controller.count}')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {
              controller.increment();
            }, child: const Text('Increment')),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Secondpage(),
                  ),
                );
              },
              child: const Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
