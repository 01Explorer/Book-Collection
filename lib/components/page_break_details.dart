import 'package:flutter/material.dart';

class ContainerPageBreak extends StatelessWidget {
  final String message;
  const ContainerPageBreak({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      height: 40,
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 67, 47, 250),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
