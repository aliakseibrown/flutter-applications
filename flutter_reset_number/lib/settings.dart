// screens/screen_yellow.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.find();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen????HAHA'),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment:
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
              Container(
              margin: const EdgeInsets.fromLTRB(0,100,40,10),
              width: 200.0,
              height: 100,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.red,
              ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child:
                  Obx(() { return Text(
                    'Reset on: ${controller.reset}', 
                    style: const TextStyle(
                    fontSize: 25,
                      color: Colors.white,
                   fontWeight: FontWeight.bold
                  ),
                    );
                  }),
                   ),
                   Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child:
                  const Text(
                     "the number you would like the counter will be reseted",
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
              margin: const EdgeInsets.fromLTRB(0,100,10,10),
              width: 100.0,
              height: 100,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.red,
              ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child:
            TextField(
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              controller: controller.textController,
              decoration: InputDecoration(
                 border: UnderlineInputBorder(),
                 suffixIcon: IconButton(
                  onPressed: controller.textController.clear,
                  icon: Icon(Icons.clear),
                  ),
                 //labelText: "${controller.count}",
                 hintText: "${controller.reset}",
                 labelStyle: const TextStyle(
                  color: Colors.black,
                   ),
                 isDense: true,
                 ),
                ),
                  ),
                  const Text(
                     "it's",
                   style: TextStyle(
                   fontSize: 12,
                   color: Color.fromRGBO(252, 142, 142, 1),
                     fontWeight: FontWeight.bold
                      ),
                    ),
                 ]),
                ),
              ]),
              Container(
              margin: const EdgeInsets.fromLTRB(10,0,10,10),
              width: 100.0,
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.grey,
              ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Obx(() { return Text(
              'actual number is: ${controller.count}',
              style: const TextStyle(
                    fontSize: 12,
                      color: Colors.white,
                   fontWeight: FontWeight.bold
                  ),);
            }),),]),),
            
            ElevatedButton(
              onPressed: () => controller.resetCounter(),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text('Reset'),
            ),
            ElevatedButton(
              onPressed: (){
                Get.back();
                controller.setReset(int.parse(controller.textController.text));
                 },
              child: const Text('Go to home'),
            ),
          ],
        ),
      ),
    );
  }
}