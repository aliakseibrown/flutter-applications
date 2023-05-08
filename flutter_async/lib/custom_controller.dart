import 'dart:async';
import 'package:get/get.dart';

class CustomController extends GetxController {
  final size = 20.obs;
  var currentTime = 0.obs;
  final interval = const Duration(seconds: 1);
  
  Future<void> countDownTimer() async {
    while(currentTime > 0){
      await Future.delayed(Duration(seconds: 1)).then((_){
          currentTime.value-=1;
      },);
    }
    currentTime.value = 0;
  }

  Future<void> setBiggerSize() async {
    currentTime.value+=5;
    countDownTimer();
    Timer(const Duration(seconds: 5), () {
      size.value+=10;
    });
  }

  Future<void>  setSmallerSize() async {
    currentTime.value+=5;
    countDownTimer();
    Timer(const Duration(seconds: 5), () {
      size.value-=10;
    });
  }

}