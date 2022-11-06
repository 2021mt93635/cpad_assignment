import 'package:cpad_assignment/constants.dart';
import 'package:cpad_assignment/models/medicineModel.dart';
import 'package:cpad_assignment/widgets/drawerWidget.dart';
import 'package:cpad_assignment/widgets/medicineItemWidget.dart';
import 'package:flutter/material.dart';

class MedicineSearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MedicineResultDetails arguments =
        ModalRoute.of(context)?.settings.arguments as MedicineResultDetails;

    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      drawer: DrawerWidget(),
      body: ListView(
        children: generateMedicineCards(arguments),
      ),
    );
  }

  List<Widget> generateMedicineCards(MedicineResultDetails resultDetails) {
    List<Widget> medicineCards = [];
    if (resultDetails.medicineItemsList.isEmpty) {
      medicineCards.add(
        const Padding(
          padding: EdgeInsets.only(
            top: 30,
          ),
          child: Center(
            child: Text(
              kNoMedicineFound,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
                fontSize: 30,
              ),
            ),
          ),
        ),
      );
    }
    for (var item in resultDetails.medicineItemsList) {
      medicineCards.add(MedicineItemWidget(medicineItem: item));
    }
    return medicineCards;
  }
}
