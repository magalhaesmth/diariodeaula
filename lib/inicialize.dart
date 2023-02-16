import 'package:aulaum/components/primeira_pagina.dart';
import 'package:flutter/material.dart';

class Inicialize extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meu app",
      theme: ThemeData(primaryColor: Colors.teal),
      home: const PrimeiraPagina(),
    );
  }
}