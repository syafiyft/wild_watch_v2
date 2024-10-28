import 'package:flutter/material.dart';
import 'get_started.dart'; // Import the GetStartedScreen from another file
import 'sign_in.dart';
import 'homepage.dart'; // Import the HomePage from homepage.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WildWatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/get-started', // Set the initial route to GetStartedScreen
      routes: {
        '/get-started': (context) => const GetStartedScreen(), // Connected to the file
        '/signin': (context) => SignInScreen(), //route to sign in
        '/home': (context) => const MyHomePage(), // Navigate to MyHomePage after sign up
      },
    );
  }
}
