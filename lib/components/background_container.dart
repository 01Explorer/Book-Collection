import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  const BackgroundContainer(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 67, 47, 250),
            Color.fromARGB(255, 38, 2, 102),
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: child,
    );
  }
}
