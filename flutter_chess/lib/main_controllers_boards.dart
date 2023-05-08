import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'board_controller.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chess Board',
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: Colors.amber),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  late String white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chess', style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25))),
      body: Center(
        child: Column(
          children: [
            GetX<BoardController>(
              tag: "Adam",
              init: BoardController('Adam'),
              builder: (controller) {
                return Column(
                  children: [  
                    Container(
                      margin: const EdgeInsets.fromLTRB(0,20,0,0),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      width: 250,
                      height: 250,
                      child:
                        ChessBoard(
                          controller: controller.boardController,
                          boardColor: BoardColor.orange,
                          boardOrientation: PlayerColor.white,
                        ),
                        ),
                    ElevatedButton(
                      child: Text('${controller.name.value}\'s Details'),
                      onPressed: ()
                      async{
                      controller.getFen();
                        var result = await(Get.to(
                          () => DetailsPage(username: 'Adam'),
                          ));
                        if(result != false) {
                        }
                      },
                    ),              
                  ],
                );
              },
            ),
            GetX<BoardController>(
              tag: "Daria",
              init: BoardController('Daria'),
              builder: (controller) {
                return Column(
                  children: [  
                    Container(
                      margin: const EdgeInsets.fromLTRB(0,0,0,0),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      width: 250,
                      height: 250,
                      child:
                        ChessBoard(
                          controller: controller.boardController,
                          boardColor: BoardColor.green,
                          boardOrientation: PlayerColor.white,
                        ),
                        ),
                                             ElevatedButton(
                      child: Text('${controller.name.value}\'s Details'),
                      onPressed: ()
                      async{
                      controller.getFen();
                        var result = await(Get.to(
                          () => DetailsPage(username: 'Daria'),
                          ));
                        if(result != false) {
                        }
                      },
                    ), 
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}



class DetailsPage extends StatelessWidget {
  final String username;
  DetailsPage({required this.username});
  @override
  TextEditingController textController = TextEditingController();
  Widget build(BuildContext context) {
    BoardController boardController = Get.find<BoardController>(tag: username);
    return Scaffold(
      appBar: AppBar(title: const Text('Detailed Page', style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25))),
      body: Column(
        children: <Widget>[
        Container(
            margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            width: 400.0,
            height: 150,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.amberAccent,
              ),
              child: Container(
                margin: const EdgeInsets.all(20),
                child: SelectableText((boardController.getFen().toString()),
                 style: const TextStyle(
                 fontSize: 25,
                 color: Colors.white,          
                 fontWeight: FontWeight.bold,
                  ),
                ),
                ),
              ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            width: 400.0,
            height: 100,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.amberAccent,
              ),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: TextField(
                 style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                 controller: textController,
                 decoration: InputDecoration(
                 border: UnderlineInputBorder(),
                 suffixIcon: IconButton(
                  onPressed: textController.clear,
                  icon: Icon(Icons.clear),
                ),
                 labelText: "FEN:",
                 labelStyle: TextStyle(
                  color: Colors.white,
                   ),
                 isDense: true,
                 ),
                ),
              ),
              ),
              Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            width: 400.0,
            height: 100,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.amber,
              ),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:
                SizedBox(
                 width: 400,
                 height: 100,
                  child:
                ElevatedButton(
                 child: Text("Epic way",
                 style: TextStyle(color: Colors.amber, fontSize: 30, fontWeight: FontWeight.bold),),
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  textStyle: TextStyle(
                  fontWeight: FontWeight.bold)
                  ),
                 onPressed: () {
                    final ffen = "r1bk3r/p2pBpNp/n4n2/1p1NP2P/6P1/3P4/P1P1K3/q5b1 b - - 1 23";
                    boardController.setFen(ffen);
                    Get.back();
                      },
                ),
                    ),
              ),
              ),
              Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            width: 400.0,
            height: 100,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.orange,
              ),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:
                SizedBox(
                 width: 400,
                 height: 100,
                  child:
                ElevatedButton(
                 child: Text("Legendary way",
                 style: TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold),),
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  textStyle: TextStyle(
                  fontWeight: FontWeight.bold)
                  ),
                 onPressed: () {
                    final ffen = "4k2r/6r1/8/8/8/8/3R4/R3K3 w Qk - 0 1";
                    boardController.setFen(ffen);
                    Get.back();
                      },
                ),
                    ),
              ),
              ),
              Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            width: 400.0,
            height: 100,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.purple,
              ),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:
                SizedBox(
                 width: 400,
                 height: 100,
                  child:
                ElevatedButton(
                 child: Text("ENORMOUS way",
                 style: TextStyle(color: Colors.purple, fontSize: 30, fontWeight: FontWeight.bold),),
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  textStyle: TextStyle(
                  fontWeight: FontWeight.bold)
                  ),
                 onPressed: () {
                    final ffen = "8/5k2/3p4/1p1Pp2p/pP2Pp1P/P4P1K/8/8 b - - 99 50";
                    boardController.setFen(ffen);
                    Get.back();
                      },
                ),
                    ),
              ),
              ),
          ElevatedButton(
          child: Text('Go back'),
          onPressed: () {
            boardController.setFen(textController.text.toString());
            Get.back();
          },
        ),

        ] 
      ),
    );
  }
}