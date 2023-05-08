import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chess_board.dart';
import 'chess_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chess Board',
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(primary:Color.fromRGBO(19, 12, 117, 1.0)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends GetView<ChessController> {
    const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ChessController controller = Get.put(ChessController());

    return Scaffold(
      appBar: AppBar(title: const Text('Chess Board', style: TextStyle( fontWeight: FontWeight.bold, color: Colors.red, fontSize: 30))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.itemCount.value,
                itemBuilder: ((context, index){
                  return Container(
                    height: 80.0,
                    margin: const EdgeInsets.all(5.0),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Color.fromRGBO(19, 12, 117, 1.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(2.0),
                          width: 55.0,
                          height: 55,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                           color: Colors.red,
                            ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text(
                              (1+index).toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const Text(
                              "step",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(252, 142, 142, 1),
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ]),
                        ),

                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 100.0,
                          height: 55,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                           color: Colors.red,
                            ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text(
                              controller.steps.value[index].white!,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const Text(
                              "white",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(252, 142, 142, 1),
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ]),
                        ),
                        
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 100.0,
                          height: 55,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                           color: Colors.red,
                            ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text(
                              controller.steps.value[index].black!,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const Text(
                              "black",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(252, 142, 142, 1),
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ]),
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          onTap: () {
                            controller.removeStep(index);
                          },
                            ),
                      ],
                    ),
                    
                  );
                }),
             ),
             )
      ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 150, child: TextField(
                  controller: controller.whiteTextEditingController,
                  decoration: const InputDecoration(
                  hintText: "The white is on...",
                  labelText: "White",
                  isDense: true,
                ),
              ),
            ),
              const SizedBox(
                width: 8,
              ),
                SizedBox(width: 150, child: TextField(
                  controller: controller.blackTextEditingController,
                  decoration: const InputDecoration(
                  hintText: "The black is on...",
                  labelText: "Black",
                  isDense: true,
                ),
              ),
            ),
            const SizedBox(
                width: 8,
              ),
            SizedBox(width: 70, child: ElevatedButton(
              onPressed: () {
                controller.addStep(
                  controller.whiteTextEditingController.text, 
                  controller.blackTextEditingController.text);
              },
              child: const Text("Add"),
            ),
            ),
            ],),
  
            const SizedBox(
                height: 80,
              ),
          ]
        ),
      ),
      
    );
  }
}
