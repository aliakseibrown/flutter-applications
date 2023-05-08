import 'package:flutter/material.dart';
import 'package:flutter_async/controller_bindings.dart';
import 'package:flutter_async/data_controller.dart';
import 'package:get/get.dart';

import 'album.dart';
import 'custom_controller.dart';
import 'dart:async';

void main(){
  //await Data_controller.fetchAlbum();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Async',
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.amber),
      ),
      initialBinding: ControllerBindings(),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget{
  late String white;
  late Future<Album> futureAlbum;
  @override

  @override
  Widget build(BuildContext context) {
    final _data_controller = Get.find<DataController>();
    final _custom_controller = Get.find<CustomController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Data', 
      style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25))),
      body: Center(
        child: Column(
          children : [
            Container(
              margin: const EdgeInsets.all(20.0),
              width: 400,
              height: 250,
              color: Colors.amber,
              child: Column(
                children : [
                  Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  width: 350,
                  height: 120,
                  color: Colors.purple,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    TextField(
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      controller: _data_controller.textController,
                      decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: _data_controller.textController.clear,
                        icon: Icon(Icons.clear),
                        ),
                      labelText: "address:",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      isDense: true,
                      ),
                    ),
                    ElevatedButton(
                      child: Text("GO",
                      style: TextStyle(color: Colors.orangeAccent, fontSize: 30, fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(
                      fontWeight: FontWeight.bold)
                      ),
                      onPressed: () {
                        _data_controller.setAddress();
                        _data_controller.getLength();
                      },
                      ),
                  ]),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    width: 250,
                    height: 70,
                    color: Colors.white,
                    child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Text('response length:'),
                    Obx(() =>  Text('${_data_controller.length}'),),
                    Obx(() =>  Text('${_data_controller.address}'),),
                  ],),
                  ),
              ],
              ),),
            //Text('AlbumID: ${_data_controller.list[0].userId}'),
           
           Container(
              margin: const EdgeInsets.all(20.0),
              width: 400,
              height: 300,
              color: Colors.amber,
              child: Column(
                children : [
                  Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  width: 350,
                  height: 200,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Obx(() => 
                    Text('Żabka)', 
                    style: TextStyle( color: Colors.white, fontSize: _custom_controller.size.value.toDouble(), fontWeight: FontWeight.bold),
                    ),),
                    
                  ]),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    width: 400,
                    height: 70,
                    //color: Colors.white,
                    child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      ElevatedButton(
                      child: Text("BIGGER",
                      style: TextStyle(color: Colors.orangeAccent, fontSize: 30, fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(
                      fontWeight: FontWeight.bold)
                      ),
                      onPressed: () {
                        _custom_controller.setBiggerSize();
                      },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                      child: const Text("SMALLER",
                      style: TextStyle(color: Colors.orangeAccent, fontSize: 30, fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(
                      fontWeight: FontWeight.bold)
                      ),
                      onPressed: () {
                        _custom_controller.setSmallerSize();
                      },
                      ),
                  ],),
                  ),
                  
              ],
              ),),
            Container(
              
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  width: 80,
                  height: 80,
                  //color: Colors.amber,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                    ),),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    // const Text('$custom_controller.timer', 
                    // style: const TextStyle( color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),
                    // ),
                    Obx(() => 
                    Text('${_custom_controller.currentTime.value}', 
                    style: const TextStyle( color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),
                    ),),
                    
                  ]),
                  ),
            
          ],
          
        ),
      ),
    );
  }
}
