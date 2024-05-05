import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ht_2/signup.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg3.jpg'), // Replace with your background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 350,
            height: 400,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255)
                  .withOpacity(0.2), // Background box color with opacity
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 'Sign In' text at the top center of the page
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Sign In Here',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 21, 8, 8),
                          offset: Offset(1, 1),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();

                    try {
                      // Sign in with email and password
                      await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      // Navigate to home page if sign-in is successful
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } catch (e) {
                      print('Error signing in: $e');
                      // Handle sign-in errors (e.g., invalid email/password)
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error !',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            content: Text('Invalid email or password.',
                                style: TextStyle(
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      offset: Offset(1, 1),
                                      blurRadius: 6,
                                    ),
                                  ],
                                )),
                            backgroundColor: Colors.white.withOpacity(0.3),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    shadows: [
                                      Shadow(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        offset: Offset(1, 1),
                                        blurRadius: 6,
                                      ),
                                    ], // Change text color to orange
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 255, 203, 59),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(
                        255, 116, 51, 13), // Change button color to yellow
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 246, 246, 246),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to the SignUpPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 236, 29),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 21, 8, 8),
                              offset: Offset(1, 1),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
