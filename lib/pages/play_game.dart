import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_project/pages/home_page.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({super.key});

  @override
  State<PlayGame> createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  final Random _random = Random();
  late int guessNumber;
  int wrongChoice = 0;
  int more = 0;
  int less = 0;

  @override
  void initState() {
    guessNumber = _random.nextInt(300);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade800,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Hello, my name is Bot",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Wrong: $wrongChoice",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              Text(
                "($guessNumber)",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                ),
              ),
              const Text(
                "\nCorrect or Not?",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            content: SizedBox(
                              height: 200.0,
                              width: 200.0,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  const Text(
                                    "Congratulation",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Your number is: $guessNumber",
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Wrong guess: $wrongChoice",
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const HomePage();
                                      },
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Thank you",
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Correct",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          wrongChoice++;
                        },
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            content: const SizedBox(
                              height: 200.0,
                              width: 200.0,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "ok :(",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "More or Less?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  more = _random.nextInt(10);
                                  setState(
                                    () {
                                      guessNumber = guessNumber + more;
                                    },
                                  );
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "More",
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  less = _random.nextInt(10);
                                  setState(
                                    () {
                                      guessNumber = guessNumber - less;
                                    },
                                  );
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Less",
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Wrong",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "+($more)",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    "-($less)",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
