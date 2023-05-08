// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'number.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 28, 151, 192)),
        useMaterial3: false,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final TextEditingController _numberController = TextEditingController();
  final int _random = 1 + Random().nextInt(100);
  final List<Number> numbers = [];
  int _num = 0;
  int index = 0;
  bool _enable = true;
  bool _more = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('The guesser', style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            ), )
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              //color: Color.fromARGB(210, 255, 59, 24),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(175, 50, 165, 20),
                  child: TextField(
                    enabled: _enable,
                    controller: _numberController,
                    //onSubmitted: (),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter> [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: IconButton(
                    icon: _enable ?
                    Icon(Icons.add_circle, color: Color.fromARGB(255, 207, 49, 32), size: 40,): 
                    Icon(Icons.add_circle, color: Color.fromARGB(255, 157, 157, 157), size: 40,),
                    onPressed: _enable
                        ? () => {                      
                      setState(() {
                        print(_random);
                        if(_numberController.text.isEmpty){
                          print('NULL');
                        }else{
                        //_userNumbers.add(int.tryParse(_numberController.text));
                        _num = int.parse(_numberController.text);
                        if( _num > _random){
                          numbers.add(Number(
                            id: index,
                            color: Colors.redAccent,
                            num: _num,
                            title: ' is more',
                        ));
                          _more = true;
                        }else if(_num < _random){
                         numbers.add(Number(
                           id: index,
                           color: Colors.blue,
                           num: _num,
                          title: ' is less',
                        ));
                          _more = false;
                        }else{
                          numbers.add(Number(
                            id: index,
                            color: Colors.green,
                            num: _num,
                            title: ' WON',
                            ));
                          _enable = false;
                        }    
                        index++;   
                        _numberController.clear();
                        }
                      })
                    }
                        : null,
                    //child: Text('Add'),
                  ),
                ),
              ],
            )),
            Card(
              elevation: 6,
              child: Container(
                //color: _more ? Color.fromARGB(100, 255, 100, 0): Color.fromARGB(255, 91, 237, 55),
                width: double.infinity,
                //child: const Text('Wykres'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: 600.0,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(255, 205, 205, 205)),
                child:ListView.builder(
                reverse: false,
                   itemCount: numbers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: UniqueKey(),
                        //key: Key(numbers[index].toString()), 
                        child: 
                        Container(
                          height: 100.0,
                          //width: 50,
                          decoration: BoxDecoration(
                          color: numbers[index].color,
                          //color: _more ? Color.fromARGB(210, 255, 59, 24): Color.fromARGB(255, 91, 237, 55),
                          borderRadius: BorderRadius.circular(50),
                          ),
                          child: ListTile(
                            //_userNumbers.length == 0 ? null:
                            title: Padding(
                              padding: EdgeInsets.fromLTRB(13, 23, 10, 20),
                              child:
                              Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(text: numbers[index].num.toString(), style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                       )),
                                      TextSpan(text: numbers[index].title, style: TextStyle( 
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontWeight: FontWeight.bold ,)),
                                    ],
                                  ),
                                ),                         
                              ),
                          ),
                        ),
                        
                        onDismissed: (direction) {
                              setState( () {
                                numbers.removeAt(index);
                              });
                            },
                          );
                        }
      ),
               ),
                ),
          ],
        ));
  }
}
