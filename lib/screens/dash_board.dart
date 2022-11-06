import 'dart:async';

import 'package:cpad_assignment/constants.dart';
import 'package:cpad_assignment/models/medicineModel.dart';
import 'package:cpad_assignment/models/orderDetailModel.dart';
import 'package:cpad_assignment/sections/transactions.dart';
import 'package:cpad_assignment/services/networking.dart';
import 'package:cpad_assignment/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: ListView(scrollDirection: Axis.vertical, children: [
          sizedBox,
          divider,
          Container(
            child: TextButton.icon(
              onPressed: () async {
                Navigator.popAndPushNamed(context, kOrderMedicinePage,
                    arguments: await DataConverter().getOrderDetails());
              },
              icon: Icon(
                Icons.medical_services,
                size: 80,
              ),
              label: Text(
                "Order Medicine",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          sizedBox,
          divider,
          Container(
            child: TextButton.icon(
              onPressed: () {
                Navigator.popAndPushNamed(context, kUnderConstructionPage);
              },
              icon: Icon(
                Icons.medical_information,
                size: 80,
              ),
              label: Text(
                "Book Doctor",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          sizedBox,
          divider,
          Container(
            child: TextButton.icon(
              onPressed: () {
                Navigator.popAndPushNamed(context, kUnderConstructionPage);
              },
              icon: Icon(
                Icons.vaccines,
                size: 80,
              ),
              label: Text(
                "Book Lab Test",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          divider,
          TransactionSection(),
          divider,
        ]),
      ),
    );
  }
}
