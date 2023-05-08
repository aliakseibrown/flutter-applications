import 'package:flutter_async/custom_controller.dart';
import 'package:get/get.dart';
import 'data_controller.dart';

class ControllerBindings extends Bindings {
    @override
    void dependencies() {
      Get.put<DataController>(DataController());
      Get.put<CustomController>(CustomController());
    }
}