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
}