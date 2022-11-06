import 'dart:convert';
import 'package:cpad_assignment/constants.dart';
import 'package:cpad_assignment/models/medicineModel.dart';
import 'package:cpad_assignment/models/orderDetailModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ServerData {
  final String url;

  ServerData(this.url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

class ServerDataHelper {
  Future<dynamic> getMedicinesList() async {
    ServerData networkHelper = ServerData(kMedicineListUrl);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getOrdersList() async {
    ServerData networkHelper = ServerData(kOrderListUrl);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}

class DataConverter {
  ServerDataHelper serverHelper = ServerDataHelper();

  Future<List<OrderDetailModel>> getOrderDetails() async {
    List<OrderDetailModel> orderDetails = [];
    var orderData = await serverHelper.getOrdersList();
    List<dynamic> entitlements = orderData["orders"];
    int dataOrderNo = 0;
    int dataEta = 0;
    String dataStatus = "";
    for (var entitlement in entitlements) {
      List<MedicineItem> dataOrderedMedicines = [];
      (entitlement as Map<String, dynamic>).forEach((key, value) {
        switch (key) {
          case "no":
            dataOrderNo = int.parse(value);
            break;
          case "eta":
            dataEta = int.parse(value);
            break;
          case "status":
            dataStatus = value.toString();
            break;
          case "medicines":
            dataOrderedMedicines =
                getMedicineDataList((value as List<dynamic>));
            break;
        }
      });
      orderDetails.add(OrderDetailModel(
          orderNo: dataOrderNo,
          eta: dataEta,
          status: dataStatus,
          orderedMedicineList: dataOrderedMedicines));
    }
    return orderDetails;
  }

  Future<List<MedicineItem>> getMedicineList(String searchString) async {
    var medicineData = await serverHelper.getMedicinesList();

    List<dynamic> entitlements = medicineData["medicines"];
    List<MedicineItem> filteredList = getMedicineDataList(entitlements)
        .where(
          (element) =>
              element.name.toLowerCase().contains(searchString.toLowerCase()),
        )
        .toList();

    return filteredList;
  }

  List<MedicineItem> getMedicineDataList(List<dynamic> entitlements) {
    String dataname = '';
    String datadescription = '';
    bool dataisDoctorPrescriptionRequired = false;
    int datastock = 0;
    double dataprice = 0;

    List<MedicineItem> medicineListCollection = [];

    for (var entitlement in entitlements) {
      (entitlement as Map<String, dynamic>).forEach((key, value) {
        switch (key) {
          case "name":
            dataname = value.toString();
            break;
          case "description":
            datadescription = value.toString();
            break;
          case "doctor":
            dataisDoctorPrescriptionRequired = (value == 'true');
            break;
          case "stock":
            datastock = int.parse(value);
            break;
          case "price":
            dataprice = double.parse(value);
            break;
        }
      });
      medicineListCollection.add(MedicineItem(
        name: dataname,
        description: datadescription,
        isDoctorPrescriptionRequired: dataisDoctorPrescriptionRequired,
        stock: datastock,
        price: dataprice,
      ));
    }
    return medicineListCollection;
  }
}


// (value as Map<String, dynamic>).forEach((key2, value2) {
//           print(key2);
//           print(value2);
//         });
