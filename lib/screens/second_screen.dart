import 'package:flutter/material.dart';
import 'package:flutter_test_app/bindings/init_controller.dart';
import 'package:flutter_test_app/controllers/counter_controller.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  final String? imagePath;

  const SecondScreen({Key? key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Counter 2: ${counterController.secondCounter.value}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Activity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Opened: ${counterController.secondCounter.value} time(s)',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            InkWell(
              onTap: () {},
              child: Ink(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(imagePath!))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
