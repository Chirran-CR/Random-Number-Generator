import "package:flutter/material.dart";
import "package:random_number_generator/screens/input_taking_screen.dart";

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: InputTakingScreen(),
      home: Scaffold(
        body: InputTakingScreen(),
      ),
    );
  }
}
