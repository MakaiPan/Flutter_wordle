import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/constants.dart';

List<String> letters = "QWERTYUIOPASDFGHJKLZXCVBNM".split('');

class Keypad extends StatelessWidget {
  final double letterSpace = 8.0;
  final columnSpace = 8.0;
  const Keypad({Key? key}) : super(key: key);

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
              height: letterButtonHeight,
              width: letterButtonWidth,
            ),
            Wrap(
              spacing: letterSpace,
              alignment: WrapAlignment.center,
              children: letters.sublist(19, 26).map((e) {
                return letterButter(
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

  Widget enterButton({
    required double height,
    required double width,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        color: Colors.grey,
        height: height,
        width: width * 1.5,
        child: Center(
          child: Text(
            'ENTER',
            style: GoogleFonts.inter().copyWith(
              fontSize: 10.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget deleteButton({
    required double height,
    required double width,
  }) {
    return ClipRRect(
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
    );
  }

  Widget letterButter({
    required double height,
    required double width,
    required String text,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        color: Colors.grey,
        height: height,
        width: width,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter().copyWith(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
