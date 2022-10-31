import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/bindings/init_controller.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  static CounterController instance = Get.find();

  static const intentChannel =
      MethodChannel("com.example.flutter_test_app/intentChannel");

  // observable variable
  var firstCounter = 0.obs;
  var secondCounter = 0.obs;
  var thirdCounter = 0.obs;

  // increase counter by one for first page
  void incrementFirstCounter() {
    firstCounter.value++;
  }

  // decrement counter by one for first page
  void decrementFirstCounter() {
    if (firstCounter.value > 0) {
      firstCounter.value--;
    }
  }

  // increase counter by one for second page
  void incrementSecondCounter() {
    secondCounter.value++;
  }

  // decrement counter by one for second page
  void decrementSecondCounter() {
    if (secondCounter.value > 0) {
      secondCounter.value--;
    }
  }

  // increase counter by one for second page
  void incrementThirdCounter() {
    thirdCounter.value++;
  }

  // decrement counter by one for second page
  void decrementThirdCounter() {
    if (thirdCounter.value > 0) {
      thirdCounter.value--;
    }
  }

  // reset counters
  void resetCounter() {
    firstCounter.value = 0;
    secondCounter.value = 0;
    thirdCounter.value = 0;
  }

  Future<void> startKotlinActivity() async {
    try {
      //final ByteData bytes = await rootBundle.load('assets/images/rice.jpg');
      final arguments = {
        //"image": bytes.buffer.asUint8List(),
        "first_counter": counterController.firstCounter.value,
        "second_counter": counterController.secondCounter.value,
        "third_counter": counterController.thirdCounter.value
      }; // argument to be passed
      final String result =
          await intentChannel.invokeMethod("StartActivity", arguments);
      debugPrint('Result: $result ');
    } on PlatformException catch (e) {
      debugPrint("Error: '${e.message}'.");
    }
  }
}
