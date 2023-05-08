import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';


class BoardController extends GetxController {
  ChessBoardController boardController = ChessBoardController();
  final TextEditingController textController = TextEditingController();


  final fen = ''.obs;
  final name = 'Adam'.obs;
  final temperature = 0.obs;

  String getFen() {
    fen.value = boardController.getFen();
    return fen.value;
  }

  void setFen(String fen) {
    if(fen != ''){
      boardController.loadFen(fen);
      textController.clear();
    }
  }

  BoardController(String user) {
    name.value = user;
  }
}