import 'package:flutter/material.dart';

List<Color> colors = [
  Colors.blue.shade200,
  Colors.purple.shade50,
  Colors.green.shade200,
  Colors.blue.shade100,
  Colors.green.shade100
];

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
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Row(
          children: [
            const Icon(Icons.qr_code),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 20),
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
