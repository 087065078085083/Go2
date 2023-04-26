import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAMMBj-9psjgLE8xUdzszIExJHAePb-8rE",
            authDomain: "go2v2-c921e.firebaseapp.com",
            projectId: "go2v2-c921e",
            storageBucket: "go2v2-c921e.appspot.com",
            messagingSenderId: "304474359129",
            appId: "1:304474359129:web:1afb8499326395fe6ef848",
            measurementId: "G-Y0KB249MTY"));
  } else {
    await Firebase.initializeApp();
  }
}
