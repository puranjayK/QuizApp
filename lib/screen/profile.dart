import 'package:flutter/material.dart';
import 'package:login/Data/GlobalData.dart' as Data;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 300,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(20)),

                ),
                // color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Icon(Icons.supervised_user_circle_outlined,size: 50,color: Color.fromARGB(255, 180, 192, 240),),
                      Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 10)),
                      Text("Username : ${Data.username}",style: TextStyle(fontSize:40,color:Color.fromARGB(255, 180, 192, 240) ,fontFamily: 'OpenSans')),
                      Text("Quiz Score : ${Data.score}",style: TextStyle(fontSize:40,color:Color.fromARGB(255, 180, 192, 240) ,fontFamily: 'OpenSans')),

                  ],
                ),),
            )
          ],
        ),),
    );
  }
}