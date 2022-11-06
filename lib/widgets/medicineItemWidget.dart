import 'package:cpad_assignment/constants.dart';
import 'package:cpad_assignment/models/medicineModel.dart';
import 'package:flutter/material.dart';

class MedicineItemWidget extends StatelessWidget {
  final MedicineItem medicineItem;

  MedicineItemWidget({required this.medicineItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, kMedicineDetailPage,
            arguments: medicineItem);
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.only(
          left: 15,
          top: 15,
          right: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.lightBlueAccent.shade400,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                medicineItem.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                medicineItem.price.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
