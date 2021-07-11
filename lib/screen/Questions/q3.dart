import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/screen/Questions/q4.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:login/Data/GlobalData.dart' as Data;

class Question3 extends StatefulWidget {
  const Question3({ Key? key }) : super(key: key);

  @override
  _Question3State createState() => _Question3State();
}

class _Question3State extends State<Question3> {
int _isPressed=0;
  int _isCorrect=-1;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
              title: Text("Question 3"),

        backgroundColor: Colors.indigo.shade300,


    ),
    drawer: Drawer(
      child: SizedBox(
        height: 10,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 150)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(MdiIcons.numeric1Box,size: 50,color:(Data.q1==1)?Colors.green:(Data.q1==0)?Colors.red:Colors.black)  ,
                Icon(MdiIcons.numeric2Box,size: 50,color:(Data.q2==1)?Colors.green:(Data.q2==0)?Colors.red:Colors.black),
                Icon(MdiIcons.numeric3Box,size: 50,color:(Data.q3==1)?Colors.green:(Data.q3==0)?Colors.red:Colors.black),
                Icon(MdiIcons.numeric4Box,size: 50,color:(Data.q4==1)?Colors.green:(Data.q4==0)?Colors.red:Colors.black),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            Row(

              crossAxisAlignment: CrossAxisAlignment.center,
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Icon(MdiIcons.numeric5Box,size: 50,color:(Data.q5==1)?Colors.green:(Data.q5==0)?Colors.red:Colors.black),
                Icon(MdiIcons.numeric6Box,size: 50,color:(Data.q6==1)?Colors.green:(Data.q6==0)?Colors.red:Colors.black),
              ],
            )
          ],
        ),),
    ),
      backgroundColor: Color.fromARGB(255, 180, 192, 240),
      body: Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("The United Nations Organization has its Headquarters at",style: TextStyle(fontSize: 25,color: Colors.white),),
            Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 10)),
            ElevatedButton(
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all((_isCorrect==1&&_isPressed==1) ?Colors.green :(_isCorrect==0&&_isPressed==1)? Colors.red: Colors.white),

              ),
              onPressed: (_isPressed==0)?()async{
                setState(() {
                  Data.q3=0;
                  _isPressed=1;
                  _isCorrect=0;
                });
              }:null, 
              child: Text("Bali",style: TextStyle(fontSize:20,color:_isPressed==1?Colors.white: Color.fromARGB(255, 180, 192, 240) ,fontFamily: 'OpenSans'))
              ),

            Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 10)),

            ElevatedButton(
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all((_isCorrect==1&&_isPressed==2) ?Colors.green :(_isCorrect==0&&_isPressed==2)? Colors.red: Colors.white),

              ),
              onPressed: (_isPressed==0)?()async{
                setState(() {
                  Data.q3=0;
                  _isPressed=2;
                  _isCorrect=0;
                });
              }:null, 
              child: Text("Hague",style: TextStyle(fontSize:20,color:_isPressed==2?Colors.white: Color.fromARGB(255, 180, 192, 240)  ,fontFamily: 'OpenSans'))
              ),

            Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 10)),

            ElevatedButton(
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all((_isCorrect==1&&_isPressed==3) ?Colors.green :(_isCorrect==0&&_isPressed==3)? Colors.red: Colors.white),

              ),
              onPressed: (_isPressed==0)?()async{
                setState(() {
                  Data.q3=1;
                  _isPressed=3;
                  _isCorrect=1;
                });
              }:null, 
              child: Text("New York, USA",style: TextStyle(fontSize:20,color:_isPressed==3?Colors.white: Color.fromARGB(255, 180, 192, 240) ,fontFamily: 'OpenSans'))
              ),

            Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 10)),

            ElevatedButton(
              // key: ,
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all((_isCorrect==1&&_isPressed==4) ?Colors.green :(_isCorrect==0&&_isPressed==4)? Colors.red: Colors.white),

              ),
              onPressed: (_isPressed==0)?()async{
                setState(() {
                  Data.q3=0;
                  _isPressed=4;
                  _isCorrect=0;
                });
              }:null, 
              child: Text("Washington DC",style: TextStyle(fontSize:20,color:_isPressed==4?Colors.white: Color.fromARGB(255, 180, 192, 240)  ,fontFamily: 'OpenSans'))
              ),


            Padding(padding: EdgeInsets.fromLTRB(0, 35, 0, 10)),

              ElevatedButton(onPressed: (){
                (_isPressed!=0)?
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                     return Question4();
                 })) : Fluttertoast.showToast(msg: "Please choose an option")
                 ;
              }, 
              child:SizedBox(
                width: 100,
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Next",style: TextStyle(fontSize:20,color:Color.fromARGB(255, 180, 192, 240) ,fontFamily: 'OpenSans'),),
                    InkWell(
                      child: Icon(Icons.navigate_next_rounded,
                      size: 40,),
              
                  ),
                  
                  ],
                ),
              ) )
          ],
        ) ,),

      
    );
  }
}