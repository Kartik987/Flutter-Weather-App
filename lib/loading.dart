import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'location.dart';


class Mylocation extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Getlocation(),
    );
  }
}

class Getlocation extends StatefulWidget {
  @override
  _GetlocationState createState() => _GetlocationState();
}

class _GetlocationState extends State<Getlocation> {


void initState(){
  super.initState();
  task();
}
void task() async{ 
  
 Position location= await getLocation();
  getdata(location);
}
Future<Object> getLocation() async{
 
 Position position =await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
 
return position;
 
  }
void getdata(Position obj) async{
  
  try{
    String city;
  latitude=obj.latitude;
  longitude=obj.longitude;
  http.Response response= await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=eddecead83e3ea372fdd4abaac589f60#');
  String data=response.body;
  var decodedata=jsonDecode(data);
      city=decodedata['name'];
 http.Response response1= await http.get('https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=eddecead83e3ea372fdd4abaac589f60#');
String data1=response1.body;
var decodedata1=jsonDecode(data1);
  // maxtemp=decodedata['main']['temp_max'] - 273.15;
  // mintemp=maxtemp.toInt();
  // desc=decodedata['weather'][0]['description'];
  // code=decodedata['weather'][0]['id'];
  // icon=getWeatherIcon(code);
  // msg=getMessage(maxtemp.toInt());

  Navigator.push(context, MaterialPageRoute(builder: (context){

    return Showweather(data:decodedata,data1:decodedata1);
  }));}
  catch(e){}
}

  @override
  
  Widget build(BuildContext context) {
    return Container(
     
      child: Center(
     child:SpinKitDoubleBounce(
  color: Colors.white,
  size: 70.0,
),
      
    ),
    );
  }

}

  
