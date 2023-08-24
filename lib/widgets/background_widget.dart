import 'package:flutter/material.dart';

class BackgroundParentWidget extends StatelessWidget {
  const BackgroundParentWidget({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 105, 31, 243),
              Color.fromARGB(255, 136, 79, 244),
              Color.fromARGB(255, 90, 37, 189),
            ],
          ),
        ),
        child: child);
  }
}
