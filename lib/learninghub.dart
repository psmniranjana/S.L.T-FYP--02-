// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'lhone.dart'; // Import lhone.dart
import 'lhtwo.dart'; // Import lhtwo.dart

class LearningHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg4.jpg'), // Your image path here
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 90),
              child: Text(
                'Learning Hub',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20), // Add padding
                      child: Align(
                        alignment: Alignment.centerLeft, // Align to page left
                        child: Stack(
                          children: [
                            Container(
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    offset: Offset(0, 3),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/LH1.png'), // Replace with your image path
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            0, 255, 253, 253),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          // Inner shadow
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 8,
                                            spreadRadius: -4,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                        border: Border.all(
                                            width: 2,
                                            color: Color.fromARGB(
                                                11, 255, 255, 255)),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LHOnePage()),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10),
                                            Text(
                                              'Interactive Lessons, ',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 251, 251, 251),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Open Sans',
                                                shadows: [
                                                  Shadow(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    offset: Offset(2, 2),
                                                    blurRadius: 5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                height: 15), // Add line space
                                            Text(
                                              'Vocabulary Building Exercises, ',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Open Sans',
                                                shadows: [
                                                  Shadow(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    offset: Offset(2, 2),
                                                    blurRadius: 5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                height: 15), // Add line space
                                            Text(
                                              'Grammar and Structure',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Open Sans',
                                                shadows: [
                                                  Shadow(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    offset: Offset(2, 2),
                                                    blurRadius: 5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Icon(
                                Icons.chevron_right,
                                size: 45,
                                color: Color.fromARGB(255, 236, 236, 236),
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 9, 96, 87),
                                    offset: Offset(2, 2),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 20), // Add padding
                      child: Align(
                        alignment: Alignment.centerRight, // Align to page right
                        child: Stack(
                          children: [
                            Container(
                              height: 150,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    offset: Offset(0, 3),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/dic.webp'), // Replace with your image path
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    // Align text to center
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          // Inner shadow
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 3,
                                            spreadRadius: 2,
                                            offset: Offset(3, 4),
                                          ),
                                        ],
                                        border: Border.all(
                                            width: 2,
                                            color: Color.fromARGB(
                                                11, 255, 255, 255)),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LHTwoPage()),
                                          );
                                        },
                                        child: Center(
                                          // Align text to center
                                          child: Text(
                                            "Dictionary Feature",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              shadows: [
                                                Shadow(
                                                  color: Color.fromARGB(
                                                      255, 95, 63, 12),
                                                  offset: Offset(2, 2),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Icon(
                                Icons.chevron_right,
                                size: 45,
                                color: Color.fromARGB(255, 236, 236, 236),
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 98, 64, 13),
                                    offset: Offset(2, 2),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
