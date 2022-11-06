import 'package:cpad_assignment/constants.dart';
import 'package:cpad_assignment/models/medicineModel.dart';
import 'package:cpad_assignment/models/orderDetailModel.dart';
import 'package:cpad_assignment/widgets/orderDetailWidget.dart';
import 'package:flutter/material.dart';

class TransactionSection extends StatelessWidget {
  final bool isActiveTransactionList;
  final List<OrderDetailModel> orderDetailsList;
  bool isEmpty = false;

  TransactionSection(
      {this.isActiveTransactionList = true, this.orderDetailsList = const []});
  @override
  Widget build(BuildContext context) {
    List<OrderDetailModel> orderDetails = getLastTransactionDetails();

    String getOrderDisplayImage(String status) {
      if (status == kOutForDelivery) {
        return kOutForDeliveryImage;
      } else if (status == kInTransit) {
        return kInTransitImage;
      } else if (status == kDispatched) {
        return kDispatchedImage;
      }
      return kDispatchedImage;
    }

    String getEtaDisplay(int eta) => eta == 0 ? "Today" : "$eta days";

    String getDisplayContent(int orderNo, String status) =>
        "Order No:$orderNo - $status";

    List<Widget> orderDetailsDisplay() {
      List<Widget> orderDetailWidgetList = [];

      isEmpty = orderDetails.isEmpty;
      //isEmpty = true;
      if (isEmpty) {
        orderDetailWidgetList.add(
          const Padding(
            padding: EdgeInsets.only(left: 25, top: 20),
            child: SizedBox(
              height: 50,
              child: Text(
                kNoTransactionsFound,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
        );
      } else {
        for (var item in orderDetails) {
          orderDetailWidgetList.add(OrderDetailWidget(
            displayImage: getOrderDisplayImage(item.status),
            displayContent: getDisplayContent(item.orderNo, item.status),
            displayETA: getEtaDisplay(item.eta),
            orderDetail: item,
          ));
        }
      }

      return orderDetailWidgetList;
    }

    return Container(
      height: isEmpty ? 236 : 460,
      child: Column(children: [
        ListTile(
          title: Text(
            isActiveTransactionList ? kActiveTransaction : kLastTransaction,
            style: const TextStyle(fontSize: 25, color: Colors.blue),
          ),
          leading: const Icon(
            Icons.receipt_long,
            size: 30,
            color: Colors.blue,
          ),
        ),
        Container(
          height: isEmpty ? 180 : 400,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: orderDetailsDisplay(),
          ),
        )
      ]),
    );
  }

  List<OrderDetailModel> getLastTransactionDetails() {
    List<OrderDetailModel> orderDetailList = [];

    if (orderDetailsList.isEmpty) {
      List<MedicineItem> medicineList = [];
      medicineList.add(MedicineItem(
        name: "Crocin - 100",
        description: "Good for fever",
        isDoctorPrescriptionRequired: false,
        stock: 2,
        price: 20,
      ));
      orderDetailList.add(OrderDetailModel(
          orderNo: 3,
          eta: 0,
          status: kOutForDelivery,
          orderedMedicineList: medicineList));
      medicineList.add(MedicineItem(
        name: "Crocin - 50",
        description: "Good for fever",
        isDoctorPrescriptionRequired: false,
        stock: 1,
        price: 10,
      ));
      orderDetailList.add(OrderDetailModel(
          orderNo: 2,
          eta: 2,
          status: kInTransit,
          orderedMedicineList: medicineList));
      medicineList.add(MedicineItem(
        name: "Crocin - 250",
        description: "Good for fever",
        isDoctorPrescriptionRequired: false,
        stock: 3,
        price: 30,
      ));
      orderDetailList.add(OrderDetailModel(
          orderNo: 1,
          eta: 4,
          status: kDispatched,
          orderedMedicineList: medicineList));
    } else {
      orderDetailList = orderDetailsList;
    }

    return orderDetailList;
  }
}
