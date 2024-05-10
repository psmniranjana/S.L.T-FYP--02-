import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ht_2/welcome.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required WelcomePage child}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _logoController; // animation controller
  late Animation<Offset> _logoOffsetAnimation;
  late AnimationController _textController;
  late Animation<Offset> _textOffsetAnimation;

  @override
  void initState() {
    super.initState();
    _logoController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _textController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    //  offset animation for logo
    _logoOffsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOutBack,
    ));

    // offset animation for text
    _textOffsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOutBack,
    ));

    _logoController.forward();
    _textController.forward();

    Timer(Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _logoOffsetAnimation,
              child: Image.asset(
                'assets/images/logo2.png',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            SlideTransition(
              position: _textOffsetAnimation,
              child: Text(
                "HandTalker",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
