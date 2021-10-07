import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rain_animation/dot.dart';
import 'package:rain_animation/dots_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Dot> dots;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animationController.repeat();

    dots = List.generate(
      150,
      (index) {
        final Random random = Random();
        return Dot(
          index: index,
          height: random.nextInt(30),
          startingDyFactor: random.nextDouble(),
          startingDxFactor: random.nextDouble(),
          velocity: random.nextDouble() + 1,
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return CustomPaint(
            size: size,
            painter: DotsPainter(
              _animationController.value,
              dots,
            ),
          );
        },
      ),
    );
  }
}
