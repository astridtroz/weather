
import 'package:flutter/material.dart';
import 'package:weather/acitivity/home.dart';
import 'package:weather/acitivity/loading.dart';

void main(){
  runApp(MaterialApp(
 debugShowCheckedModeBanner: false,
    routes: {
      "/": (context)=> const Loading(),
  "/home": (context)=> const Home(),
      "/loading": (context)=>Loading(),

      /* route is the map,,home is road, context is current page and Home is the page we need to visit */
  }
  )
  );
}
