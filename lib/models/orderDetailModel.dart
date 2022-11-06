import 'package:cpad_assignment/models/medicineModel.dart';

class OrderDetailModel {
  final int orderNo;
  final int eta;
  final String status;
  List<MedicineItem> orderedMedicineList;

  OrderDetailModel(
      {required this.orderNo,
      required this.eta,
      required this.status,
      required this.orderedMedicineList});
}
