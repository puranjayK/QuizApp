import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/Data/GlobalData.dart' as Data;
class DatabaseService{
  final uid;
  String username="";
  DatabaseService({this.uid});

  // final Future<FirebaseApp> _initialisation = Firebase.initializeApp();
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference userCollection= FirebaseFirestore.instance.collection('quiz');
  Future updateUserData(String _username) async{
    this.username=_username;
    return await userCollection.doc(uid).set({
      'username':_username
    });
  }


  Stream<QuerySnapshot> get users{
    return userCollection.snapshots();
  }
  final CollectionReference quizCollection=FirebaseFirestore.instance.collection('quiz');
Future updateQuizData(bool quizDone,int score)async{
  return await quizCollection.doc(uid).set({
    'quiz given': quizDone,
    'username': Data.username,
    'score':score
  });
}
  Stream<QuerySnapshot> get quiz{
    return quizCollection.snapshots();
  }
}
