import "dart:math";

import "package:flutter/material.dart";

class RandomGeneratorScreen extends StatefulWidget {
  final int min, max;

  const RandomGeneratorScreen(
      {super.key, required this.min, required this.max});

  @override
  State<RandomGeneratorScreen> createState() => _RandomGeneratorScreenState();
}

class _RandomGeneratorScreenState extends State<RandomGeneratorScreen> {
  late int min = widget.min;
  late int max = widget.max;

  int? _genratedNum;
  final generateAnum = Random();

  @override
  Widget build(BuildContext context) {
    print("mins $min");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate Page"),
        // centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            _genratedNum?.toString() ?? "Generate A Number",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _genratedNum = min + generateAnum.nextInt(max - min + 1);
          });
        },
        child: const Icon(Icons.add_task_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
