
import 'package:flutter/material.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'album.dart';

class DataController extends GetxController {
  var list = <Album>[].obs;
  var isLoading = true.obs;
  var address = ''.obs;
  var data = ''.obs;
  var length = ''.obs;
  final response = ''.obs;
  TextEditingController textController = TextEditingController();

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchAlbum();
  // }
  Future<void> setAddress() async{
    address.value = textController.text;
    //textController.clear();
  }
  Future<void> getLength() async {
     final response = await http
       .get(Uri.parse('$address'));
    length.value = response.body.length.toString();
    print(response.body.length.toString());
  }
  
  
}