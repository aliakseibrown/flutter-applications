import 'package:flutter/material.dart';
import 'package:flutter_quiz/bindings.dart';
import 'package:flutter_quiz/settings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'counter_controller.dart';
import 'bindings.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(primary:Color.fromRGBO(19, 12, 117, 1.0)),
      ),
      title: 'Named Routes Example',
      initialRoute: '/home',
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
      getPages: [
        GetPage(
          name: '/home',
          page: () => MyHomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: '/settings',
          page: () => const SettingsScreen(),
          binding: SettingsBindings(),
        ),
      ],
    );
  }
}


class MyHomePage extends StatelessWidget {
  final CounterController _counterController = Get.put(CounterController());

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('The Counter', style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            ), )
        ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(40,200,40,0),
              width: 100.0,
              height: 100,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              color: Color.fromRGBO(19, 12, 117, 1.0),
              ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child:
              Obx(() => Text(
                  '${_counterController.count}',
                  style: const TextStyle(
                    fontSize: 50,
                      color: Colors.white,
                   fontWeight: FontWeight.bold
                  ),
                )),
                   )],),),
            Container(
              margin: const EdgeInsets.fromLTRB(40,20,40,10),
              width: 400.0,
              height: 150,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.red,
              ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child:
                  Text(
                    'You have pushed the button this many times:', 
                    style: const TextStyle(
                    fontSize: 25,
                      color: Colors.white,
                   fontWeight: FontWeight.bold
                  ),
                    ),
                   ),
                   Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child:
                  const Text(
                      'soooo many:',
                   style: TextStyle(
                   fontSize: 10,
                   color: Color.fromRGBO(252, 142, 142, 1),
                     fontWeight: FontWeight.bold
                      ),
                    ),
                   ),
                   ]),
                ),
                Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 150,
              child:
                  ElevatedButton(
              onPressed: () => Get.toNamed('/settings'),
              child: const Text('Settings'),
            ),
                   ),
          ],
          
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterController.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
