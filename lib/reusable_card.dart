import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinycolor2/tinycolor2.dart';
import 'package:async/async.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({Key? key, required this.color, required this.text})
      : super(key: key);

  final Color color;
  final String text;

  static ReusableCard fromJson(json) =>
      ReusableCard(color: HexColor(json['color']), text: json['text']);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 14.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: TinyColor.fromColor(color).darken(9).toColor(),
                ),
                child: const Padding(
                    padding: EdgeInsets.all(5.0), child: Icon(Icons.qr_code))),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              text,
              style:
                  GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
