import 'package:cpad_assignment/constants.dart';
import 'package:cpad_assignment/models/medicineModel.dart';
import 'package:cpad_assignment/screens/medicine_search_result.dart';
import 'package:cpad_assignment/widgets/drawerWidget.dart';
import 'package:cpad_assignment/widgets/iconButtonWidget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

class MedicineDetailPage extends StatefulWidget {
  const MedicineDetailPage({Key? key}) : super(key: key);

  @override
  _MedicineDetailPageState createState() => _MedicineDetailPageState();
}

class _MedicineDetailPageState extends State<MedicineDetailPage> {
  int orderQuantity = 1;

  Widget displayPrescriptionUploadIfRequired(bool isPrescriptionRequired) {
    if (isPrescriptionRequired) {
      return ElevatedButton(
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            Alert(
              context: context,
              type: AlertType.success,
              title: "Upload Success",
              desc: "Prescription has been added",
              buttons: [
                DialogButton(
                  onPressed: () {
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, kDashBoard, (route) => false);
                    // Navigator.maybePop(context);
                    Navigator.pop(context);
                  },
                  width: 120,
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ).show();
          } else {
            Alert(
              context: context,
              type: AlertType.error,
              title: "Upload Failed",
              desc: "Prescription has not been added",
              buttons: [
                DialogButton(
                  onPressed: () {
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, kDashBoard, (route) => false);
                    // Navigator.maybePop(context);
                    Navigator.pop(context);
                  },
                  width: 120,
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ).show();
          }
        },
        child: const Text(kUploadPrescription),
      );
    } else {
      return sizedBox;
    }
  }

  @override
  Widget build(BuildContext context) {
    final MedicineItem arguments =
        ModalRoute.of(context)?.settings.arguments as MedicineItem;

    //orderQuantity = arguments.stock;

    return Scaffold(
        appBar: AppBar(
          title: const Text(kAppTitle),
        ),
        drawer: DrawerWidget(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 15,
              ),
              child: Text(
                arguments.name,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 50,
              ),
              child: Text(
                arguments.description,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueAccent),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  kQuantityRquired,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.blueAccent),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    orderQuantity.toString(),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (orderQuantity <= arguments.stock) {
                        orderQuantity++;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.blueAccent,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (orderQuantity > 1) {
                        orderQuantity--;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            displayPrescriptionUploadIfRequired(
                arguments.isDoctorPrescriptionRequired),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: IconButtonWidget(
                buttonContent: "Add to Cart",
                isBigButton: true,
              ),
            ),
          ],
        ));
  }
}
