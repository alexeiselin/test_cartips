import 'package:flutter/material.dart';

const List<String> options = ['Все коды', 'Избранное', 'Машина', 'Добавить'];

class ReusableCard2 extends StatefulWidget {
  const ReusableCard2({Key? key}) : super(key: key);

  @override
  State<ReusableCard2> createState() => _ReusableCard2State();
}

class _ReusableCard2State extends State<ReusableCard2> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 15.0,
        children: List<Widget>.generate(
          options.length,
          (int idx) {
            return ChoiceChip(
              elevation: 1,
              shadowColor: Colors.grey,

            backgroundColor: Colors.white10,
                selectedColor: Colors.black,
                label: Text(options[idx]),
                labelStyle: TextStyle(
                  color: _value == idx ? Colors.white : Colors.black,
                ),
                selected: _value == idx,
                onSelected: (bool selected) {
                  setState(() {
                    _value = (selected ? idx : null)!;
                  });
                });
          },
        ).toList(),
      ),
    );
  }
}
