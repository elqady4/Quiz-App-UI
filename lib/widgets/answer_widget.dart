import 'package:flutter/material.dart';

class AnswerWidget extends StatefulWidget {
  const AnswerWidget({
    super.key,
    required this.character,
    required this.color,
    required this.answer,
    required this.onTap,
    required this.selected,
  });

  final String character;
  final Color color;
  final String answer;
  final void Function()? onTap;
  final bool selected;

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 2,
      child: Stack(
        children: [
          AnimatedPositioned(
            top: widget.selected ? 0 : 1,
            bottom: widget.selected ? 0 : 1,
            left: widget.selected ? 0 : 1,
            right: widget.selected ? 0 : 1,
            duration: const Duration(milliseconds: 500),
            child: AnimatedScale(
              scale: widget.selected ? 0.8 : 1.0,
              duration: const Duration(milliseconds: 1500),
              child: AnimatedRotation(
                turns: widget.selected ? 0 : 2,
                duration: const Duration(milliseconds: 900),
                curve: Curves.fastOutSlowIn,
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    width: widget.selected ? size.width / 3 : size.width / 2,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: widget.selected
                          ? Colors.white
                          : const Color(0xff66FBD1).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: widget.selected ? 0 : 100,
                            child: ClipOval(
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset('assets/icegif-1098.gif'))),
                        SizedBox(
                          height: widget.selected ? 35 : 50,
                          width: widget.selected ? 35 : 50,
                          child: CircleAvatar(
                              backgroundColor: widget.color,
                              child: Text(
                                widget.character,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: widget.selected ? 25 : 30),
                              )),
                        ),
                        Text(
                          widget.answer,
                          style: TextStyle(
                            fontSize: widget.selected ? 32 : 60,
                            fontWeight: FontWeight.bold,
                            color:
                                widget.selected ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
