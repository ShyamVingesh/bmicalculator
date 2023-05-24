import 'package:flutter/material.dart';
//Green:#12a644,grery:#403f3d

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor:Color(0xff12a644)
  ),
  home: MyApp(),
  debugShowCheckedModeBanner: false,
),);

class MyApp extends StatefulWidget {
 // const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height =170.0;
  double _weight=75.0;
  int _bmi=0;
  String _conditions='Select Data';
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: size.height*0.40,
            width: double.infinity,
            decoration: new BoxDecoration(color: Color(0xff12a644)),
            padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("BMI",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 60.0),),
                Text("Calculator",style: TextStyle(color: Colors.white,fontSize: 40.0),),
              SizedBox(
                width: double.infinity,
                child: Container(
                  child: Text("$_bmi",
                    style: TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.bold,
                      fontSize: 45.0 ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
                RichText(
                  text: TextSpan(
                  text: "Condition: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "$_conditions ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                    fontWeight: FontWeight.bold
                    ),)
                  ]

                ),
                )
              ],
            ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height*0.03,),
                  Text("Choose Data",style: TextStyle(color: Color(0xFF12a644),fontWeight: FontWeight.bold,fontSize: 30.0),),
                  SizedBox(height: size.height*0.03,),
                  RichText(
                    text: TextSpan(
                        text: "Height : ",
                        style: TextStyle(
                            color: Color(0xFf403f3d),
                            fontSize: 25.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_height cm",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Slider(value: _height,
                      min:0,
                      max: 250,
                      onChanged: (height){
                        setState(() {
                          _height=height;
                        });
                      },
                    divisions: 250,
                      label:"$_height",
                    activeColor: Color(0xFF403f3d),//color change
                    inactiveColor: Colors.grey, //already color blue and change the color grey
                      ),
                  SizedBox(height: size.height*0.03,),
                  RichText(
                    text: TextSpan(
                        text: "Weight : ",
                        style: TextStyle(
                            color: Color(0xFf403f3d),
                            fontSize: 25.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_weight kg ",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Slider(value: _weight,
                    min:0,
                    max: 300,
                    onChanged: (weight){
                      setState(() {
                        _weight=weight;
                      });
                    },
                    divisions: 300,
                    label:"$_weight",
                    activeColor: Color(0xFF403f3d),//color change
                    inactiveColor: Colors.grey, //already color blue and change the color grey
                  ),
                  Container(
                    width: size.width*0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            _bmi=(_weight/((_height/100)*(_height/100))).round().toInt();
                            if(_bmi>=18.6 && _bmi<=25){_conditions="Normal";}
                            else if(_bmi>=25 && _bmi<=30){_conditions="OverWeight";}
                            else if(_bmi>=30){_conditions="Obesity";}
                            else{_conditions="Underweight";}

                          });
                        },
                        child: Text("Calculate",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                       //color: Color(0xff12a644),
                       // padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


