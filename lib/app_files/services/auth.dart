import 'package:firebase_auth/firebase_auth.dart';

import '../models/student.dart';

class AuthService{

  //instance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on user id
  StudentUser? _userFromFirebaseUser(User? user){
    return user != null ? StudentUser(suid: user.uid) :null;
  }

  //auth change user stream
  Stream<StudentUser?> get stuser{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
      
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}