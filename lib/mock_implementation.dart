import 'package:flutter/services.dart';
import 'reusable_card.dart';
import 'dart:convert';

late Future<List<ReusableCard>> cardsFuture;

Future<List<ReusableCard>> readJson() async {
  await Future.delayed(const Duration(milliseconds: 2000));
  final data = await rootBundle.loadString('assets/sample.json');
  final body = await json.decode(data);
  return body.map<ReusableCard>(ReusableCard.fromJson).toList();
}
