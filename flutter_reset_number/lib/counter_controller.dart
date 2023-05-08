// controllers/counter_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CounterController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final GetStorage _storage = GetStorage();
  final String _storageKey = 'clicksCount';
  final String _storageResetKey = 'resets';

  final RxInt _count = RxInt(0);
  final RxInt _reset = RxInt(12);

  int get count => _count.value;
  int get reset => _reset.value;

  @override
  void onInit() {
    super.onInit();
    int? storedCount = _storage.read(_storageKey);
    int? storedReset = _storage.read(_storageResetKey);
    if (storedCount != null) {
      _count.value = storedCount;
    }
    if (storedReset != null) {
      _reset.value = storedReset;
    }
  }

  void setReset(int value) {
    _reset.value = value;
    if(value != null) {
      _storage.write(_storageKey, _reset.value);
    }
  }

  void incrementCounter() {
    _count.value++;
    if(_count.value >= _reset.value) {
      _count.value = 0;
    }
    _storage.write(_storageKey, _count.value);
  }

  void resetCounter() {
    _count.value = 0;
    _storage.write(_storageKey, _count.value);
  }

  void setCounter(int value) {
    _count.value = value;
    if(value != null) {
      _storage.write(_storageKey, _count.value);
    }
    textController.clear();
  }

  String getCounter() {
    return _storage.read(_storageKey);
  }
  
}
