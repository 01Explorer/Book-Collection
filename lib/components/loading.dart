import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: ClipRRect(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SpinKitFadingCube(
                color: Colors.white,
                size: 50,
                duration: Duration(milliseconds: 700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
