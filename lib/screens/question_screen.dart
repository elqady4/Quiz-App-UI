import 'dart:async';

import 'package:capped_progress_indicator/capped_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/answer_widget.dart';
import 'package:quiz_app/widgets/background_widget.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _currentTime = 10;
  Timer? _timer;
  List<bool> selected = [true, true, true, true];
  bool isAnswerd = false;
  int itemSelected = -1;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), _timerCallback);
  }

  @override
  void dispose() {
    // Cancel the timer.
    _timer?.cancel();
    super.dispose();
  }

  void _timerCallback(Timer timer) {
    if (_currentTime == 0) {
      // Stop the timer.
      _timer?.cancel();

      // Show the dialog box.
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Time\'s Up!'),
            content:
                const Text('The fastest animal in the world is the cheetah.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  // Close the dialog box.
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Update the current time.
      setState(() {
        _currentTime--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundParentWidget(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/BATMAN.png',
                    height: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Oh My Quiz!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
              const Text(
                'what is the fastest animal in the world?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: size.width / 2.5,
                    height: 150,
                    child: CircularCappedProgressIndicator(
                      color: Colors.redAccent,
                      value: _currentTime / 10,
                      strokeWidth: 8,
                      strokeCap: StrokeCap.square,
                    ),
                  ),
                  Text(
                    counterTime(),
                    style: const TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ],
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: widgetsInRow(),
                children: List.generate(
                  widgetsInList(),
                  (index) => AnswerWidget(
                      selected:
                          !isAnswerd ? selected[index] : selected[itemSelected],
                      onTap: () {
                        if (!isAnswerd) {
                          isAnswerd = !isAnswerd;
                          setState(() {
                            selected[index] = !selected[index];
                            _timer!.cancel();
                            itemSelected = index;
                          });
                        }
                      },
                      character: character(index),
                      color: characterBackground(index),
                      answer: answer(index)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String counterTime() =>
      _currentTime > 9 ? '0:$_currentTime' : '0:0$_currentTime';

  String answer(int index) {
    return !isAnswerd
        ? questions[1].answers[index]
        : questions[1].answers[itemSelected];
  }

  Color characterBackground(int index) {
    return !isAnswerd ? backColor(index) : backColor(itemSelected);
  }

  String character(int index) {
    return !isAnswerd ? backCharacrter(index) : backCharacrter(itemSelected);
  }

  int widgetsInList() => !isAnswerd ? 4 : 1;

  int widgetsInRow() => !isAnswerd ? 2 : 1;

  String backCharacrter(int index) {
    if (index == 0) {
      return 'A';
    } else if (index == 1) {
      return 'B';
    } else if (index == 2) {
      return 'C';
    } else {
      return 'D';
    }
  }

  Color backColor(int index) {
    if (index == 0) {
      return Colors.amber;
    } else if (index == 1) {
      return Colors.lightBlue;
    } else if (index == 2) {
      return Colors.lightGreen;
    } else {
      return Colors.redAccent;
    }
  }
}
