import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class worker
{
  String location='';
 worker({  required this.location})
 {
  location= this.location;
 }
 String temp='';
  String humidity="";
  String air_speed="";
  String description="";
  String main="";
String icon="";

 Future<void> getData()
 async {
  try {
   Response response = await http.get(Uri.parse(
       'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c0176d7b97750720879c70e8a75d70f8'));
   Map data = jsonDecode(response.body);


   Map temp_data = data['main'];
   String getTemp = (temp_data['temp'] -273.15).toString();
   Map wind = data['wind'];
   String getAir_speed = (wind["speed"]/0.27777777777778).toString();
   String getHumidity = temp_data['temp'].toString();



   List weather_data = data['weather'];
   Map weather_main_data = weather_data[0];
   String getMain_des = weather_main_data['description'];
   String getDesc = weather_main_data["description"];



   temp = getTemp;
   humidity = getHumidity.toString();
   air_speed = getAir_speed.toString();
   description = getDesc;
   main = getMain_des;
   icon= weather_main_data['icon'];
  }
  catch(e)
  {
   temp = "Error";
   humidity =  "Error";
   air_speed =  "Error";
   description = "Error";
   main =  "Error";
   icon="09d";
  }
 }
  }

