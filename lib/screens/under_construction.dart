import 'package:cpad_assignment/constants.dart';
import 'package:cpad_assignment/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Image.asset('assets/under_construction.jpg'),
      ),
    );
  }
}
