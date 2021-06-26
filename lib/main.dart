import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app_widget.dart';

void main() {
  runApp(const AppFirebase());
}

class AppFirebase extends StatelessWidget {
  const AppFirebase({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text(
                "Não foi possível inicializar o Firebase",
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        } else {
          return Material(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
