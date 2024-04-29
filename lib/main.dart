import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ht_2/splash.dart';
import 'package:ht_2/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await _initializeFirebase();

//   runApp(MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Enter full-screen
  // for setting orientations to portrait only

  _initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 235, 167, 237)),
          useMaterial3: true,
        ),
        home: SplashPage(
          child: WelcomePage(),
        ));
  }
}

// init firebase function
_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
