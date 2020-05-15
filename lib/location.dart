import 'package:clima/newscreen.dart';
import 'package:flutter/material.dart';
import 'newscreen.dart';
import 'weathercondition.dart';
var cityname;
double latitude ;
double longitude;
String location;
double maxtemp;
int mintemp;
String desc;
int code;
String icon;
String msg;
double wind;
String clouds;
int pressure;
int humidity;
var  sunrise;
var sunset;
String date1;
String date2;
String date3;
int temp1;
int temp2;
int temp3;

int pressure1;
int humidity1;
int pressure2;
int humidity2;
int pressure3;
int humidity3;
class Showweather extends StatefulWidget {
  Showweather({this.data,this.data1});
  
  final data;
  final data1;
  @override
  _ShowweatherState createState() => _ShowweatherState();
}

class _ShowweatherState extends State<Showweather> {
@override
void initState(){
  super.initState();
  
  updateui(widget.data,widget.data1);
  
}

void updateui(dynamic decodedata, dynamic decodedata1){
 setState(() {
   
    if(decodedata != null){
         location=decodedata['name'];
         
   maxtemp=decodedata['main']['temp_max'] - 273.15;
   mintemp=maxtemp.toInt();
   wind=decodedata['wind']['speed'];
   pressure=decodedata['main']['pressure'];
   humidity=decodedata['main']['humidity'];
   sunrise=decodedata['sys']['sunrise'];
   date1=decodedata1['list'][10]['dt_txt'];
date2=decodedata1['list'][19]['dt_txt'];
date3=decodedata1['list'][28]['dt_txt'];
temp1=(decodedata1['list'][10]['main']['temp']-273.15).toInt();
temp2=(decodedata1['list'][19]['main']['temp']-273.15).toInt();
temp3=(decodedata1['list'][28]['main']['temp']-273.15).toInt();

pressure1=decodedata1['list'][10]['main']['pressure'];
pressure2=decodedata1['list'][19]['main']['pressure'];
pressure3=decodedata1['list'][28]['main']['pressure'];
humidity1=decodedata1['list'][10]['main']['humidity'];
humidity2=decodedata1['list'][19]['main']['humidity'];
humidity3=decodedata1['list'][28]['main']['humidity'];

  // mintemp=maxtemp.toInt();
  desc=decodedata['weather'][0]['description'];
   code=decodedata['weather'][0]['id'];
  icon=getWeatherIcon(code);
   msg=getMessage(maxtemp.toInt());
  }
  else{
    location='Internet Connection error';
    maxtemp=0;
    desc='Nothing';
    msg='Nothing';

  }
   

 });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            

            height:double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image:DecorationImage(image: AssetImage('images/weather.jpg'),
              fit: BoxFit.cover,
              
              )
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              
           children: <Widget>[
           
            Container(
              
              child:Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: <Widget>[
                    
                     FlatButton(onPressed: () async {
                       var typename= await
                       Navigator.push(context, MaterialPageRoute(builder:(context){
                         return Newscreen();
                       }));
                         cityname=typename;
                     }, 
                     
                     child: Icon(
                Icons.near_me,
                color:Colors.teal,
                size:40.0,
            ),
            ),
           ],
                  ),    
                    
                ),
              )
            ),
            SizedBox(
              height:20.0,
            ),

Container(
                
              child:Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text('$location', style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                      ),),
                      SizedBox(
                            width:15.0
                      ),
                   Text('$mintemp', style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                      ),),
                      Text('° ',style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),),
                      SizedBox(
                            width:2.0
                      ),
                      Text('C',style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),),
                      SizedBox(
                            width:10.0,
                      ),
                      Text('$icon', style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),),
                  ]
                ),
              )
            ),
            SizedBox(
                            height:30.0
                      ),
            Container(
                
              child:Center(
                child: Text('$desc', style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),),
              )
            ),
                    SizedBox(
                            height:12.0
                      ),
                Container(
                
              child:Center(
                child:   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,  
                  children: <Widget>[
                    Text('Wind speed: $wind', style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),),
                          Text('m/s', style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),),
                  ],
                ),
              )
            ),
            SizedBox(
                            height:12.0
                      ),
                Container(
                
              child:Center(
                child:   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,  
                  children: <Widget>[
                    Text('Pressure: $pressure', style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),),
                          Text('hpa', style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),),
                  ],
                ),
              )
            ),
            SizedBox(
                            height:12.0
                      ),
                Container(
                
              child:Center(
                child:   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,  
                  children: <Widget>[
                    Text('Humidity: $humidity', style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),),
                          Text('%', style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),),
                  ],
                ),
              )
            ),
           SizedBox(
                            height:60.0
                      ),
              Container(
                
              child:SingleChildScrollView(
                              child: Center(
                  child:   Padding(
                    padding: const EdgeInsets.fromLTRB(20.0,0,0,20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: <Widget>[
                        Expanded(
                        
                                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisSize: MainAxisSize.min,
                            textBaseline: TextBaseline.ideographic,
                            // crossAxisAlignment: CrossAxisAlignment.baseline,  
                            children: <Widget>[
                               Text('$date1', style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.yellowAccent,
                                    ),),
                                     SizedBox(
                                  height:20.0
                            ),
                              Row(
                                children: <Widget>[
                                  Text('Temp : $temp1', style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white70,
                          ),),
                          Text('° ',style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white70,
                          ),),
                          
                          Text('C',style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white70,
                          ),),
                                ],
                              ),
                          
                                     SizedBox(
                                  height:20.0
                            ),
                            
                                   Row(
                                     children: <Widget>[
                                       Text('Press : $pressure1', style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white70,
                              ),),
                               Text('hpa', style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.white70,
                              ),),
                                     ],
                                   ),
                             
                                     SizedBox(
                                  height:20.0
                            ),
                                     Row(
                                       children: <Widget>[
                                         Text('Humid : $humidity1', style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white70,
                              ),),
                                Text('%', style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.white70,
                              ),),
                                       ],
                                     ),
                            
                                     SizedBox(
                                  height:5.0
                            ),
                                    
                            ],
                          ),
                        ),
                         VerticalDivider(
                           width: 2.0,
                           color:Colors.white10 ,
                         ),
                        Expanded(
                                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisSize: MainAxisSize.min,
                            textBaseline: TextBaseline.ideographic,
                            // crossAxisAlignment: CrossAxisAlignment.baseline,  
                            children: <Widget>[
                               Text('$date2', style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.yellowAccent,
                                    ),),
                                     SizedBox(
                                  height:20.0
                            ),
                              Row(
                                children: <Widget>[
                                  Text('Temp : $temp2', style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white70,
                          ),),
                          Text('° ',style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white70,
                          ),),
                          
                          Text('C',style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white70,
                          ),),
                                ],
                              ),
                          
                                     SizedBox(
                                  height:20.0
                            ),
                            
                                   Row(
                                     children: <Widget>[
                                       Text('Press : $pressure2', style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white70,
                              ),),
                               Text('hpa', style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.white70,
                              ),),
                                     ],
                                   ),
                             
                                     SizedBox(
                                  height:20.0
                            ),
                                     Row(
                                       children: <Widget>[
                                         Text('Humid : $humidity2', style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white70,
                              ),),
                                Text('%', style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.white70,
                              ),),
                                       ],
                                     ),
                            
                                     SizedBox(
                                  height:5.0
                            ),
                                    
                            ],
                          ),
                        ),
VerticalDivider(  width: 2.0,
                           color:Colors.white10 ,),
                         Expanded(
                                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisSize: MainAxisSize.min,
                            textBaseline: TextBaseline.ideographic,
                            // crossAxisAlignment: CrossAxisAlignment.baseline,  
                            children: <Widget>[
                               Text('$date3', style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.yellowAccent,
                                    ),),
                                     SizedBox(
                                  height:20.0
                            ),
                              Row(
                                children: <Widget>[
                                  Text('Temp : $temp3', style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white70,
                          ),),
                          Text('° ',style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white70,
                          ),),
                          
                          Text('C',style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white70,
                          ),),
                                ],
                              ),
                          
                                     SizedBox(
                                  height:20.0
                            ),
                            
                                   Row(
                                     children: <Widget>[
                                       Text('Press : $pressure3', style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white70,
                              ),),
                               Text('hpa', style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.white70,
                              ),),
                                     ],
                                   ),
                             
                                     SizedBox(
                                  height:20.0
                            ),
                                     Row(
                                       children: <Widget>[
                                         Text('Humid : $humidity3', style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white70,
                              ),),
                                Text('%', style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.white70,
                              ),),
                                       ],
                                     ),
                            
                                     SizedBox(
                                  height:5.0
                            ),
                                    
                            ],
                          ),
                        ),
                       
                       
                      ],
                    ),
                  ),
                ),
              )
            ),
                

           ],
            ),
          ),
    );
  }
}