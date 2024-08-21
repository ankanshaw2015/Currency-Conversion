import 'package:flutter/material.dart';
import 'package:flutter_application_1/calculator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
 /* @override
  Widget build(BuildContext context) {
   return const Text('Ankan',textDirection: TextDirection.ltr,);
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body:Center(child: Text('Hello world'),)
        ),
    );*/
    @override
    Widget build(BuildContext context){
      return  const MaterialApp(
        home: MyCalc(),
      );
    }
    
     
  }
  
