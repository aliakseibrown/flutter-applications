import 'package:flutter/material.dart';
import 'chess_board.dart';
import 'package:get/get.dart';

class ChessController extends GetxController {
  Rx<List<ChessBoard>> steps = Rx<List<ChessBoard>>([]);
  TextEditingController whiteTextEditingController = TextEditingController();
  TextEditingController blackTextEditingController = TextEditingController();
  late ChessBoard chessBoard;
  var itemCount = 0.obs;
  
  @override
  void onInit(){
    super.onInit();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();
    whiteTextEditingController.dispose();
    blackTextEditingController.dispose();
  }

  addStep(String white, String black){
    if(white != "" && black != ""){
      chessBoard = ChessBoard(white: white, black: black);
      steps.value.add(chessBoard);
    } 
    itemCount.value = steps.value.length;
    whiteTextEditingController.clear();
    blackTextEditingController.clear();
  }
  
  removeStep(int index){
    steps.value.removeAt(index);
    itemCount.value = steps.value.length;
  }
}