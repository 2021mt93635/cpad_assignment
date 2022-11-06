import 'package:cpad_assignment/constants.dart';
import 'package:cpad_assignment/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
      ),
      drawer: DrawerWidget(),
      body: const Center(
        child: Text("Cart Page"),
      ),
    );
  }
}
