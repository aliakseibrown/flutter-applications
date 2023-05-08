import 'package:get/get.dart';
import 'counter_controller.dart';

class SettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(() => CounterController());
  }
}

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(() => CounterController());
  }
}