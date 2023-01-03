import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> optionsList(BuildContext context) {
  return [
    AppLocalizations.of(context)!.all_codes,
    AppLocalizations.of(context)!.take_choice,
    AppLocalizations.of(context)!.car,
    AppLocalizations.of(context)!.add
  ];
}

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
        spacing: 10.0,
        children: List<Widget>.generate(
          optionsList(context).length,
          (int idx) {
            return ChoiceChip(
                elevation: 1,
                shadowColor: Colors.grey,
                backgroundColor: Colors.white10,
                selectedColor: Colors.black,
                label: Text(
                  style: GoogleFonts.roboto(),
                    optionsList(context)[idx]),
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
