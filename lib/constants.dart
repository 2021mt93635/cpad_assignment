import 'package:flutter/material.dart';

const String kOrderMedicinePage = 'order_medicine';
const String kUnderConstructionPage = 'under_construction';
const String kCartPage = 'cart_page';
const String kDashBoardPage = 'dash_board';
const String kMedicineSearchResultPage = 'MedicineSearchResult';
const String kMedicineDetailPage = 'MedicineDetailPage';
const String kAppTitle = 'Medical';
const String kDashBoard = 'Dash Board';
const String kOrderMedicine = 'Order Medicine';
const String kBookDoctorApp = 'Book Doctor Appointment';
const String kBookLab = 'Book Lab Appointment';
const String kCart = 'Cart';

const String kAppImage = 'assets/app_image.png';
const String kOutForDeliveryImage = 'assets/outfordelivery.jpg';
const String kInTransitImage = 'assets/transit1.jpg';
const String kDispatchedImage = 'assets/dispatched1.jpg';
const String kOutForDelivery = 'Out for Delivery';
const String kInTransit = 'In Transit';
const String kDispatched = 'Dispatched';
const String kNoMedicineFound = 'No medicine found.\nPlease search again!!';
const String kUploadPrescription = 'Upload Prescription';
const String kQuantityRquired = 'Quantity Required: ';
const String kAddedToCart = 'Added to Cart';
const String kAddedToCartDesc = 'Items has been added to cart';

const String kNo = 'no';
const String kEta = 'eta';
const String kStatus = 'status';
const String kMedicines = 'medicines';
const String kName = 'name';
const String kDescription = 'description';
const String kDoctor = 'doctor';
const String kStock = 'stock';
const String kPrice = 'price';

const String kActiveTransaction = 'Active Transactions';
const String kLastTransaction = 'Last Transactions';

const String kMedicineListUrl =
    'https://24e7831c-8151-4479-9141-072a32b26f1d.mock.pstmn.io/getmedicinesList/user';

const String kOrderListUrl =
    'https://24e7831c-8151-4479-9141-072a32b26f1d.mock.pstmn.io/getOrderDetails/user';

const Divider divider = Divider(
  thickness: 10,
  color: Color.fromARGB(255, 238, 229, 229),
);

const SizedBox sizedBox = SizedBox(
  height: 20,
);

const InputDecoration kSearchTextInputDecoration = InputDecoration(
  hintText: 'Search medicine',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
