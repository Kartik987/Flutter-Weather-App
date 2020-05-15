import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location.dart';
double latitude;
double longitude;
String lang='en';
void main() => runApp(MaterialApp(
  theme: ThemeData(
    brightness:Brightness.dark,
  ),
home:Scaffold(
 
  body: Newscreen(),
)

));

class Newscreen extends StatefulWidget {
  @override
  _NewscreenState createState() => _NewscreenState();
}

class _NewscreenState extends State<Newscreen> {
  String cityname;
  
  void getdatawithcity(String cityname,String lang) async{
  
  try{
  http.Response response= await http.get('https://api.openweathermap.org/data/2.5/weather?q=$cityname&lang=$lang&appid=eddecead83e3ea372fdd4abaac589f60#');
  http.Response response1= await http.get('https://api.openweathermap.org/data/2.5/forecast?q=$cityname&appid=eddecead83e3ea372fdd4abaac589f60#');
  String data=response.body;
  String data1=response1.body;
  var decodedata1=jsonDecode(data1);
  var decodedata=jsonDecode(data);


  Navigator.push(context, MaterialPageRoute(builder: (context){

    return Showweather(data:decodedata,data1:decodedata1);
  }));

  }catch(e){
      
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
             decoration: BoxDecoration(
              image:DecorationImage(image: AssetImage('images/weather.jpg'),
              fit: BoxFit.cover,
              
              )
            ),
        padding: EdgeInsets.only(top:40.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(style: TextStyle(color:Colors.black),

                  decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.white,
                  ),
                  hintText: 'Enter City Name',
                  hintStyle: TextStyle(
                    color:Colors.grey,
                  ),
                  border:OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
                ),
                onChanged: (value){
                  cityname=value;
                },
              ),
              
            ),
            SizedBox(
              height:20.0,
            ),
            FlatButton(
              color: Colors.teal,
              shape: RoundedRectangleBorder(
  borderRadius: new BorderRadius.circular(15.0),
  side: BorderSide.none,
),
              onPressed: () async{
               
                getdatawithcity(cityname,lang);
                
                 
              }, 
            
            child: Text('Get Weather' , style: TextStyle(fontSize:25.0),)),
             SizedBox(
              height:20.0,
            ),
           

          ],
        ),
        
      ),
    );
  }
}
