import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_application/screens/result_screen.dart';
import 'package:rock_paper_scissors_application/screens/start_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    int me = 1;
    int enemy = 2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => StartScreen(),
                ),
                (route) => false);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity),
              RotationTransition(
                turns: AlwaysStoppedAnimation(180 / 360),
                child: Container(
                  width: 120,
                  height: 200,
                  child: Image(
                    image: AssetImage('images/$enemy.png'),
                  ),
                ),
              ),
              SizedBox(height: 100),
              Text(
                'LET\'S PLAY!',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 100),
              Text(
                'PICK AN OPTION:',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          me = 2;
                          enemy = Random().nextInt(3) + 1;
                          _screenNavigator(
                            context: context,
                            pageRoute: ResultScreen(enemy: enemy, me: me),
                          );
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF9C27B0),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        width: 100,
                        height: 100,
                        child: Image(
                          image: AssetImage('images/2.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          me = 1;
                          enemy = Random().nextInt(3) + 1;
                          _screenNavigator(
                            context: context,
                            pageRoute: ResultScreen(enemy: enemy, me: me),
                          );
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF9C27B0),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        width: 100,
                        height: 100,
                        child: Image(
                          image: AssetImage('images/1.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          me = 3;
                          enemy = Random().nextInt(3) + 1;
                          _screenNavigator(
                            context: context,
                            pageRoute: ResultScreen(enemy: enemy, me: me),
                          );
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF9C27B0),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        width: 100,
                        height: 100,
                        child: Image(
                          image: AssetImage('images/3.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _screenNavigator({required context, required pageRoute}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => pageRoute,
      ),
    );
  }
}
