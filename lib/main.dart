import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_as/firebase_options.dart';
import 'package:test_as/pages/home.dart';
import 'package:test_as/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: StreamBuilder<User?>(
          stream:  FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot ) {
            if(snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            if(snapshot.connectionState == ConnectionState.active) {
              if(snapshot.data == null) {
                return LoginPage();
              } else {
                return HomePage();
              }
            }
          }
      ),
    );
  }
}


