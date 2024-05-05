import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ht_2/home.dart';
import 'package:ht_2/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 350,
            height: 500,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255)
                  .withOpacity(0.2), // Background box color with opacity
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign Up Here',
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
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(230, 255, 255,
                            255), // Change label text color to white
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
                        color: Color.fromARGB(230, 255, 255,
                            255), // Change label text color to white
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(230, 255, 255,
                            255), // Change label text color to white
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _buildSignUpButton(),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 246, 246, 246),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to the SignInPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()),
                          );
                        },
                        child: Text(
                          'Sign In',
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
      ),
    );
  }

  ElevatedButton _buildSignUpButton() {
    bool _isLoading = false; // Add a boolean to track loading state

    return ElevatedButton(
      onPressed: _isLoading
          ? null
          : () async {
              // Disable button when loading
              setState(() {
                _isLoading = true; // Set loading state to true
              });

              String email = _emailController.text.trim();
              String password = _passwordController.text.trim();
              String confirmPassword = _confirmPasswordController.text.trim();

              if (email.isEmpty || password.isEmpty) {
                // Show alert if email or password is empty
                setState(() {
                  _isLoading = false;
                });
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Error !',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      content: Text('Please enter email and password.',
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
                return;
              }
              if (password.length < 6) {
                setState(() {
                  _isLoading = false;
                });
                // Show alert if password length is less than 6 characters
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Error !',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      content:
                          Text('Password must be at least 6 characters long.',
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
                return;
              }

              if (password != confirmPassword) {
                // Show alert if passwords don't match
                setState(() {
                  _isLoading = false;
                });
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Error !',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      content: Text('Passwords do not match.',
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
                return;
              }

              try {
                // Create user with email and password
                UserCredential userCredential =
                    await _auth.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );

                // Add user data to Firestore
                await _firestore
                    .collection('users')
                    .doc(userCredential.user!.uid)
                    .set({
                  'email': email,
                  // Add other user information here if needed
                });
                // Delay navigation by 2 seconds to show buffering icon
                await Future.delayed(Duration(seconds: 2));

                // Navigate to the home page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              } catch (e) {
                print('Error signing up: $e');
                // Handle error message/display
              } finally {
                // Set loading state back to false after navigation
                setState(() {
                  _isLoading = false;
                });
              }
            },
      child: _isLoading // Show different child based on loading state
          ? CircularProgressIndicator() // Show loading indicator if loading
          : Text(
              'Sign Up',
              style: TextStyle(
                color: Color.fromARGB(255, 116, 51, 13),
                fontSize: 17,
              ),
            ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 203, 59),
      ),
    );
  }
}
