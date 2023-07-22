import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_application/screens/game_screen.dart';
import 'package:rock_paper_scissors_application/screens/start_screen.dart';

// ignore: must_be_immutable
class ResultScreen extends StatefulWidget {
  var enemy, me;
  ResultScreen({super.key, required this.enemy, required this.me});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var results = [
    'IT\'S A DRAW :|',
    'YOU LOSE :(',
    'YOU WIN :)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => StartScreen(),
                ),
                (route) => false);
          },
          child: Icon(
            Icons.close_sharp,
            size: 30,
            weight: 5,
            color: Colors.black,
          ),
        ),
        elevation: 0,
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
                  width: 200,
                  height: 200,
                  child: Image(
                    image: AssetImage(
                        'images/' + widget.enemy.toString() + '.png'),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Text(
                results[_resultNumber(widget.me, widget.enemy)],
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => GameScreen(),
                      ),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Color(0xFF9C27B0),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  minimumSize: Size(300, 70),
                ),
                child: Text(
                  'PLAY AGAIN',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 30),
                ),
              ),
              SizedBox(height: 60),
              Container(
                width: 200,
                height: 200,
                child: Image(
                  image: AssetImage('images/' + widget.me.toString() + '.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _resultNumber(int me, int enemy) {
    int num = 0;
    if (me == 1 && enemy == 2) {
      num = 2;
    } else if (me == 1 && enemy == 3) {
      num = 1;
    } else if (me == 2 && enemy == 1) {
      num = 1;
    } else if (me == 2 && enemy == 3) {
      num = 2;
    } else if (me == 3 && enemy == 1) {
      num = 2;
    } else if (me == 3 && enemy == 2) {
      num = 1;
    } else if (me == enemy) {
      num = 0;
    }
    return num;
  }
}
