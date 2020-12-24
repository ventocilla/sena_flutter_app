import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sena_flutter_app/helpers/firebase_errors.dart';
import 'package:sena_flutter_app/models/user.dart';

class UserManager extends ChangeNotifier {

  UserManager(){
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseUser user;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> signIn({User user, Function onFail, Function onSucess}) async {
    try {
      loading = true;
      final AuthResult result = await auth.signInWithEmailAndPassword(email: user.email, password: user.password);
      this.user = result.user;
      onSucess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser() async {
    final FirebaseUser currentUser = await auth.currentUser();
    if(currentUser != null){
      user = currentUser;
      print('UserId: ${user.uid}');
    }
    notifyListeners();
  }

}
