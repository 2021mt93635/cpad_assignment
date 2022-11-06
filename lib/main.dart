import 'package:cpad_assignment/constants.dart';
import 'package:cpad_assignment/screens/cart.dart';
import 'package:cpad_assignment/screens/dash_board.dart';
import 'package:cpad_assignment/screens/medicine_details.dart';
import 'package:cpad_assignment/screens/medicine_search_result.dart';
import 'package:cpad_assignment/screens/order_medicine.dart';
import 'package:cpad_assignment/screens/under_construction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        kDashBoardPage: (BuildContext ctx) => const DashBoard(),
        kOrderMedicinePage: (BuildContext ctx) => OrderMedicine(),
        kUnderConstructionPage: (BuildContext ctx) => const UnderConstruction(),
        kCartPage: (BuildContext ctx) => const CartPage(),
        kMedicineSearchResultPage: (BuildContext ctx) => MedicineSearchResult(),
        kMedicineDetailPage: (BuildContext ctx) => MedicineDetailPage(),
      },
      initialRoute: kDashBoardPage,
    );
  }
}
