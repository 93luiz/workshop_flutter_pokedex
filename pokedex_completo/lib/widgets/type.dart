import 'package:flutter/material.dart';
import 'package:vy_string_utils/vy_string_utils.dart';

class Type extends StatelessWidget {
  final String type;

  const Type(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(right: 4.0),
      child: Text(
        type.capitalizeAndLowercase(),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
