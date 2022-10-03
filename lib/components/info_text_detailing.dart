import 'package:flutter/material.dart';

class InfoTextDetails extends StatelessWidget {
  final String message;
  final value;
  const InfoTextDetails({Key? key, required this.message, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message + value.toString(),
      style: const TextStyle(
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
