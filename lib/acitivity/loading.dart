import 'package:flutter/material.dart';
import 'package:weather/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

String Temperature='Loading';

String temp='';
String hum='';
String air_speed='';
String des='';
String main='';
String icon='';
String city="Indore";

   startApp(String city) async
  {
    worker instance = worker(location: city);
   await instance.getData();

   temp=instance.temp;
   hum= instance.humidity;
   air_speed= instance.air_speed;
   des=instance.description;
   main=instance.main;
   icon=instance.icon;

  Future.delayed(Duration(seconds:2),(){
      Navigator.pushReplacementNamed(context,'/home',arguments:{
        "temp_value": temp,
        "hum_value":hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value":main,
        "icon_value": icon,
        "city_value":city,


      }
      );
    });
  }

  @override


  Widget build(BuildContext context) {
  Map? search=ModalRoute.of(context)?.settings.arguments as Map?;

  if(search?.isNotEmpty?? false)
    {
      city=search!['searchText'];
    }
  startApp(city);

    return Scaffold(
      backgroundColor: Color(0xff90B2F9),
        body:  Center(
            

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                Image.asset("images/get-started.png"),
                  Text("Know your weather",
                  style: (
                  TextStyle(
                    fontSize: 30,
                    color: Colors.white54,
                    fontFamily:'ProstoOne',
                    fontWeight: FontWeight.bold,
                  )
                  ),),
      SizedBox(
          height: 20,
      ),
              SpinKitFadingCube(
                color: Colors.white54,
                size: 50.0,

              ),

                ],
              ),

          ),


    );
  }

void initState()  {
  // TODO: implement initState


  super.initState();
}
}
