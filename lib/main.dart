import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> diceNumber = List<int>.filled(6, 1);
  List items = [
    "https://raw.githubusercontent.com/bishworajpoudelofficial/flutter_dice_roller/master/assets/1.png",
    "https://raw.githubusercontent.com/bishworajpoudelofficial/flutter_dice_roller/master/assets/2.png",
    "https://raw.githubusercontent.com/bishworajpoudelofficial/flutter_dice_roller/master/assets/3.png",
    "https://raw.githubusercontent.com/bishworajpoudelofficial/flutter_dice_roller/master/assets/4.png",
    "https://raw.githubusercontent.com/bishworajpoudelofficial/flutter_dice_roller/master/assets/5.png",
    "https://raw.githubusercontent.com/bishworajpoudelofficial/flutter_dice_roller/master/assets/6.png",
  ];

  void changeDice() {
    Random random = new Random();
    //setState for live change
    setState(() {
      diceNumber = [
        random.nextInt(6) + 1,
        random.nextInt(6) + 1,
        random.nextInt(6) + 1,
        random.nextInt(6) + 1,
        random.nextInt(6) + 1,
        random.nextInt(6) + 1,
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dice Roller",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Dice Roller App"),
            centerTitle: true,
          ),
          body: GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(
              items.length,
              (index) {
                return Image.network(
                  items[diceNumber[index] - 1],
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.restore),
            onPressed: () {
              changeDice();
            },
          ),
        ),
      ),
    );
  }
}
