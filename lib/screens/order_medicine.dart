import 'package:cpad_assignment/constants.dart';
import 'package:cpad_assignment/models/medicineModel.dart';
import 'package:cpad_assignment/models/orderDetailModel.dart';
import 'package:cpad_assignment/screens/medicine_search_result.dart';
import 'package:cpad_assignment/sections/transactions.dart';
import 'package:cpad_assignment/services/networking.dart';
import 'package:cpad_assignment/widgets/drawerWidget.dart';
import 'package:cpad_assignment/widgets/roundedButton.dart';
import 'package:flutter/material.dart';

class OrderMedicine extends StatelessWidget {
  String searchString = '';

  @override
  Widget build(BuildContext context) {
    final List<OrderDetailModel> arguments =
        ModalRoute.of(context)?.settings.arguments as List<OrderDetailModel>;

    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
      ),
      drawer: DrawerWidget(),
      body: ListView(children: [
        sizedBox,
        TextField(
          onChanged: (value) {
            searchString = value;
          },
          decoration: kSearchTextInputDecoration,
        ),
        RoundedButton(
          color: Colors.lightBlueAccent,
          title: "Search",
          onPressed: () async {
            // fetch details
            List<MedicineItem> medicineList = getMedicineList(searchString);
            Navigator.pushNamed(
              context,
              kMedicineSearchResultPage,
              arguments: MedicineResultDetails(
                  searchKeyWord: searchString,
                  medicineItemsList:
                      await DataConverter().getMedicineList(searchString)),
            );
          },
        ),
        divider,
        TransactionSection(
          isActiveTransactionList: false,
          orderDetailsList: arguments,
        ),
        divider,
      ]),
    );
  }

  List<MedicineItem> getMedicineList(String searchKeyWord) {
    List<MedicineItem> medicineLists = [];
    medicineLists.add(
      MedicineItem(
          name: "Crocin",
          description: "Good for fever",
          isDoctorPrescriptionRequired: false,
          stock: 5,
          price: 10),
    );
    medicineLists.add(
      MedicineItem(
          name: "Crocin - 100",
          description: "Good for fever",
          isDoctorPrescriptionRequired: false,
          stock: 5,
          price: 10),
    );
    medicineLists.add(
      MedicineItem(
          name: "Crocin - 250",
          description: "Good for fever, cough",
          isDoctorPrescriptionRequired: false,
          stock: 2,
          price: 10),
    );
    medicineLists.add(
      MedicineItem(
          name: "Crocin - 500",
          description: "Good for fever",
          isDoctorPrescriptionRequired: false,
          stock: 5,
          price: 10),
    );
    medicineLists.add(
      MedicineItem(
          name: "Crocin - 650",
          description: "Good for fever",
          isDoctorPrescriptionRequired: true,
          stock: 5,
          price: 10),
    );
    return medicineLists;
  }
}
