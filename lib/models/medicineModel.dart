class MedicineResultDetails {
  final String searchKeyWord;

  final List<MedicineItem> medicineItemsList;

  MedicineResultDetails(
      {required this.searchKeyWord, required this.medicineItemsList});
}

class MedicineItem {
  final String name;
  final String description;
  final bool isDoctorPrescriptionRequired;
  final int stock;
  final double price;

  MedicineItem({
    required this.name,
    required this.description,
    required this.isDoctorPrescriptionRequired,
    required this.stock,
    required this.price,
  });
}