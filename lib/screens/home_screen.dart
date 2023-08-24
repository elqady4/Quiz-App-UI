import 'package:flutter/material.dart';
import 'package:quiz_app/screens/question_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start Your First Quiz Now.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuestionScreen(),
                      ));
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start')),
          ),
        ],
      ),
    );
  }
}
