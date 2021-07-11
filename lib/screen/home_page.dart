import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/screen/Questions/q1.dart';
import 'package:login/screen/profile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:login/Data/GlobalData.dart' as Data;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final Future<FirebaseApp> _initialisation = Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
 
  CollectionReference users = FirebaseFirestore.instance.collection('quiz');

  
  
  final _fkey=GlobalKey<FormState>();
  bool quizGiven=false;
  @override
  Widget build(BuildContext context) {
    final User? user=FirebaseAuth.instance.currentUser;
    final userid=user!.uid;
    print(userid);
    
    return FutureBuilder(
      future:users.doc(userid).get() ,
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){


        
        if(snapshot.hasError){
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 180, 192, 240),
            drawer: Drawer(
              child : Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: SizedBox(
                    height: 200,
                    width: 250,
                    child: Container(
                      color: Colors.indigo.shade200,
                    ),
                  ),
                ),
                ListTile(
                title : Text("Sign out",style: TextStyle(fontSize: 20),),
                trailing: Icon(Icons.logout_rounded,size: 25,),
                onTap: (){
                  showDialog(context: context,
               builder: (BuildContext context)=>
               AlertDialog(
                 title:Text("Logout alert!!"),
                 content:Text("Do you really want to logout from the app"),
                 actions: [
                   ElevatedButton(onPressed: ()async{
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                  Fluttertoast.showToast(msg: "Signing out..."); 
                   }, child: Text("Yes")),
                   ElevatedButton(onPressed:(){
                     Navigator.pop(context);
                     
                   }, child: Text("No"))
                 ],
               )
              );
                 
                },
              )
              ]),
            ),
            appBar: AppBar(
            title: Text("Home"),
            backgroundColor: Colors.indigo.shade300,
           
          ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Oops... Some error occurred",
                style: TextStyle(color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 35)),
                ],
              ),
            ),
          );
        }




        if(snapshot.hasData && !snapshot.data!.exists){
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 180, 192, 240),
            drawer: Drawer(
              child : Column(
                
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: SizedBox(
                    height: 200,
                    width: 250,
                    child: Container(
                      color: Colors.indigo.shade200,
                    ),
                  ),
                ),
                ListTile(
                title : Text("Sign out",style: TextStyle(fontSize: 20),),
                trailing: Icon(Icons.logout_rounded,size: 25,),
                onTap: (){
                  showDialog(context: context,
               builder: (BuildContext context)=>
               AlertDialog(
                 title:Text("Logout alert!!"),
                 content:Text("Do you really want to logout from the app"),
                 actions: [
                   ElevatedButton(onPressed: ()async{
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                  Fluttertoast.showToast(msg: "Signing out..."); 
                   }, child: Text("Yes")),
                   ElevatedButton(onPressed:(){
                     Navigator.pop(context);
                     
                   }, child: Text("No"))
                 ],
               )
              );
                 
                },
              )
              ]),
            ),
            appBar: AppBar(
            title: Text("Home"),
            backgroundColor: Colors.indigo.shade300,
           
          ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/noData.jpg"),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Text("Oops... No Data Found",
                style: TextStyle(color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 25)),
                ],
              ),
            ),
          );
        }





        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          Data.username=data['username'];
          Data.score=data['score'];
          print(data['quiz given']);
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 180, 192, 240),
          drawer: Drawer(
            child : Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: SizedBox(
                    height: 200,
                    width: 250,
                    child: Container(
                      color: Colors.indigo.shade200
                    ),
                  ),
                ),
              ListTile(
                title: Text("Profile",style: TextStyle(fontSize: 20),),
                trailing: Icon(Icons.supervised_user_circle_outlined,size: 25,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Profile();
                  }));
                },
              ),
              ListTile(
                title : Text("Sign out",style: TextStyle(fontSize: 20),),
                trailing: Icon(Icons.logout_rounded,size: 25,),
                onTap: (){
                  showDialog(context: context,
               builder: (BuildContext context)=>
               AlertDialog(
                 title:Text("Logout alert!!"),
                 content:Text("Do you really want to logout from the app"),
                 actions: [
                   ElevatedButton(onPressed: ()async{
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                  Fluttertoast.showToast(msg: "Signing out..."); 
                   }, child: Text("Yes")),
                   ElevatedButton(onPressed:(){
                     Navigator.pop(context);
                     
                   }, child: Text("No"))
                 ],
               )
              );
                 
                },
              )
              ],)
          ),
          appBar: AppBar(
            title: Text("Home"),
            backgroundColor: Colors.indigo.shade300,
           
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 40)),
                 Text("Hey ${data['username']}\nWelcome to the QuizApp",
                style: TextStyle(color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 35)),
                Image.asset('assets/images/quiz.jpg'),
               
                Padding(padding: EdgeInsets.only(bottom: 25)),
               
                ElevatedButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  // textStyle: MaterialStateProperty.all(TextStyle(z),
                  shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)

                    )
                  ),),
                  onPressed: (){
                if(data['quiz given']==null || data['quiz given']==false)
                {
               Navigator.pushAndRemoveUntil(context, 
                    MaterialPageRoute(builder: (BuildContext context)=> Question1()), 
                    (route) => false);} 
                else
                  Fluttertoast.showToast(msg: "You have already submited the quiz!!");
                }, child: Text("Start Quiz",style: TextStyle(fontSize:20,color:Color.fromARGB(255, 180, 192, 240) ,fontFamily: 'OpenSans'),),)
                
                
                
              ],
            ),
          ));
        }
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 180, 192, 240),
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              value:null,
              strokeWidth: 7.0,
            )
          ),
        );
      }
     
    );
  }
}