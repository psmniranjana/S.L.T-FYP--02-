import 'package:flutter/material.dart';

import 'package:ht_2/signin.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Color myColor = Colors.transparent; // Initialize with a default color
  Size mediaSize = Size.zero; // Initialize with a default size

  @override
  Widget build(BuildContext context) {
    // No need to set myColor and mediaSize here
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 251, 247, 247),
        body: Stack(
          children: [
            _buildWelcomeSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "Welcome!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(157, 244, 244, 244),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            'assets/images/logo.png',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 50),
          Positioned(
            bottom: 10,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Let’s Get Started",
                    style: TextStyle(
                        color: Color.fromARGB(255, 116, 51, 13),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    left: 30,
                    child: Icon(
                      Icons.chevron_right,
                      size: 26,
                      color: Color.fromARGB(255, 236, 236, 236),
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 116, 51, 13),
                          offset: Offset(2, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 203, 59),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
