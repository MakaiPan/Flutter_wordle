import 'package:flutter/material.dart';
import 'package:wordle/constants.dart';

class AnswerBoxes extends StatelessWidget {
  const AnswerBoxes({
    Key? key,
    required this.answer,
  }) : super(key: key);
  final List<String> answer;

  final boxSpace = 8.0;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var boxSideLength = (screenWidth - kBothSidesSpace * 2 - boxSpace * 4) / 5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kBothSidesSpace),
      child: Wrap(
        spacing: boxSpace,
        children: List.generate(5, (i) => i).map((i) {
          String letter = '';
          if (i < answer.length) {
            letter = answer.elementAt(i);
          }
          return answerBox(
            context,
            text: letter,
            lenght: boxSideLength,
          );
        }).toList(),
      ),
    );
  }

  Container answerBox(
    BuildContext context, {
    required String text,
    required double lenght,
  }) {
    return Container(
      width: lenght,
      height: lenght,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
