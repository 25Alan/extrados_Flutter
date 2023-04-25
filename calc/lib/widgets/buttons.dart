import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Function buildButton;
  Buttons({super.key, required this.buildButton});

  Widget buildRowOperations(Function buildB, List<String> operator) {
    return Row(
      children: [for (var op in operator) buildB(op)],
    );
  }

  Widget buildRowNumbers(Function buildB, List<String> numbers) {
    return Row(children: [for (var number in numbers) buildB(number)]);
  }

  @override
  Widget build(BuildContext context) {
    List<String> operations = ["+", "-", "*", "/"];
    List<String> numbers1 = ["1", "2", "3"];
    List<String> numbers2 = ["4", "5", "6"];
    List<String> numbers3 = ["7", "8", "9"];
    List<String> numbers4 = [".", "0", "00"];
    return Column(
      children: [
        buildRowOperations(buildButton, operations),
        buildRowNumbers(buildButton, numbers1),
        buildRowNumbers(buildButton, numbers2),
        buildRowNumbers(buildButton, numbers3),
        buildRowNumbers(buildButton, numbers4),
        Row(
          children: [
            buildButton("CLEAR"),
            buildButton("="),
          ],
        ),
      ],
    );
  }
}
