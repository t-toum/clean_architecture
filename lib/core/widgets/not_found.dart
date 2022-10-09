import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Not Found",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
