import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Detail page"),
      ),
    );
  }
}
