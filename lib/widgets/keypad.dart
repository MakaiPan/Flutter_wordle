import 'package:flutter/material.dart';
import 'package:wordle/constants.dart';

List<String> letters = "QWERTYUIOPASDFGHJKLZXCVBNM".split('');

List<String> answer = [];

class Keypad extends StatelessWidget {
  final double letterSpace = 8.0;
  final columnSpace = 8.0;
  final Function(List<String>) pressedLetter;
  final Function pressedEnter;
  final Function(List<String>) pressedDelete;
  const Keypad({
    Key? key,
    required this.pressedLetter,
    required this.pressedEnter,
    required this.pressedDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var letterButtonWidth =
        (screenWidth - kBothSidesSpace * 2 - 9 * letterSpace) / 10;
    var letterButtonHeight = 40.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: letterSpace,
          alignment: WrapAlignment.center,
          children: letters.sublist(0, 10).map((e) {
            return letterButter(
              context,
              height: letterButtonHeight,
              width: letterButtonWidth,
              text: e,
            );
          }).toList(),
        ),
        SizedBox(height: columnSpace),
        Wrap(
          spacing: letterSpace,
          alignment: WrapAlignment.center,
          children: letters.sublist(10, 19).map((e) {
            return letterButter(
              context,
              height: letterButtonHeight,
              width: letterButtonWidth,
              text: e,
            );
          }).toList(),
        ),
        SizedBox(height: columnSpace),
        Wrap(
          spacing: letterSpace,
          alignment: WrapAlignment.center,
          children: [
            enterButton(
              context,
              height: letterButtonHeight,
              width: letterButtonWidth,
            ),
            Wrap(
              spacing: letterSpace,
              alignment: WrapAlignment.center,
              children: letters.sublist(19, 26).map((e) {
                return letterButter(
                  context,
                  height: letterButtonHeight,
                  width: letterButtonWidth,
                  text: e,
                );
              }).toList(),
            ),
            deleteButton(
              height: letterButtonHeight,
              width: letterButtonWidth,
            ),
          ],
        ),
      ],
    );
  }

  Widget enterButton(
    BuildContext context, {
    required double height,
    required double width,
  }) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          color: Colors.grey,
          height: height,
          width: width * 1.5,
          child: Center(
            child: Text(
              'ENTER',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black),
            ),
          ),
        ),
      ),
      onTap: () {
        print(answer);
        pressedEnter();
      },
    );
  }

  Widget deleteButton({
    required double height,
    required double width,
  }) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          color: Colors.grey,
          height: height,
          width: width * 1.5,
          child: const Center(
            child: Icon(
              Icons.backspace_outlined,
              size: 14.0,
            ),
          ),
        ),
      ),
      onTap: () {
        if (answer.isNotEmpty) answer.removeLast();
        pressedDelete(answer);
      },
    );
  }

  Widget letterButter(
    BuildContext context, {
    required double height,
    required double width,
    required String text,
  }) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          color: Colors.grey,
          height: height,
          width: width,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.black),
            ),
          ),
        ),
      ),
      onTap: () {
        if (answer.length < 5) answer.add(text);
        pressedLetter(answer);
      },
    );
  }
}
