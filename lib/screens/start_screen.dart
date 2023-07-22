import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_application/screens/game_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9C27B0),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity),
            SizedBox(height: 40),
            _rockPaperScissorsColumn(),
            _scissorsImage(),
            SizedBox(height: 20),
            _goButton(context),
          ],
        ),
      )),
    );
  }

  Widget _rockPaperScissorsColumn() {
    return Column(
      children: [
        Text(
          'ROCK',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 60, fontWeight: FontWeight.w200),
        ),
        Text(
          '/ PAPER /',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 60, fontWeight: FontWeight.w200),
        ),
        Text(
          'SCISSORS',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 60, fontWeight: FontWeight.w200),
        ),
      ],
    );
  }

  Widget _scissorsImage() {
    return Container(
      width: 500,
      height: 400,
      child: Image(
        image: AssetImage('images/3.png'),
      ),
    );
  }

  Widget _goButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _screenNavigator(
          context: context,
          pageRoute: GameScreen(),
        );
      },
      child: Text(
        'GO',
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 30),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        minimumSize: Size(300, 60),
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
