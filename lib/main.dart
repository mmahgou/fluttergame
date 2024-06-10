import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Root of application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameScreen(),
    );
  }
}

// Screen for the game
class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

// position of circle
class _GameScreenState extends State<GameScreen> {
  Offset _circlePosition = Offset(200, 400); // Where circle starts
  final double _circleRadius = 30.0; // Size of circle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // Called when user tries to move circle
        onPanUpdate: (details) {
          setState(() {
            _circlePosition = details.localPosition; // Changes the circle's position.
          });
        },
        // CustomPaint allows custom drawing on the screen
        child: CustomPaint(
          painter: GamePainter(_circlePosition, _circleRadius), // Custom painter for the circle
          child: Container(), // The screen to draw on
        ),
      ),
    );
  }
}

// draws the circle
class GamePainter extends CustomPainter {
  final Offset circlePosition; // Position of the circle
  final double circleRadius; // Radius of the circle

  GamePainter(this.circlePosition, this.circleRadius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red // Made it red because i love red
      ..style = PaintingStyle.fill; // Fill the circle with the color

    canvas.drawCircle(circlePosition, circleRadius, paint); // Draw the circle on the screen
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Indicate that the painter should repaint whenever the state changes
  }
}



