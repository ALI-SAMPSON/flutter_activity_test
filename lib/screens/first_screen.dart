import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/bindings/init_controller.dart';
import 'package:flutter_test_app/controllers/counter_controller.dart';
import 'package:flutter_test_app/screens/second_screen.dart';
import 'package:get/get.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  final controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    // increment counter for first page
    controller.incrementFirstCounter();

    return Scaffold(
      appBar: AppBar(
        title: Text('First Activity'),
        actions: [
          IconButton(
              onPressed: () => controller.resetCounter(),
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Opened: ${controller.firstCounter.value} time(s)',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            InkWell(
              onTap: () {
                // increment counter for second flutter screen
                controller.incrementSecondCounter();
                // navigate to second screen using getx navigation
                Get.to(() => SecondScreen(
                      imagePath: 'assets/images/salad.jpg',
                    ));
              },
              onLongPress: () {
                // increase counter here
                controller
                    .incrementThirdCounter(); // increment counter for kotlin activity
                controller
                    .startKotlinActivity(); // start android kotlin activity
              },
              child: Ink(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/rice.jpg'))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
