import 'package:cpad_assignment/models/orderDetailModel.dart';
import 'package:cpad_assignment/widgets/iconButtonWidget.dart';
import 'package:flutter/material.dart';

class OrderDetailWidget extends StatelessWidget {
  final String displayImage;
  final String displayContent;
  final String displayETA;
  final OrderDetailModel orderDetail;
  final bool isButtonVisible;

  OrderDetailWidget(
      {required this.displayImage,
      required this.displayContent,
      required this.displayETA,
      required this.orderDetail,
      this.isButtonVisible = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(left: 15, right: 5, top: 10, bottom: 10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color.fromARGB(255, 238, 229, 229),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12),
      ),
      child: Stack(
        children: [
          suggestionImage(),
          suggestionDetails(),
        ],
      ),
    );
  }

  Widget suggestionImage() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Image.asset(
          displayImage,
          height: 250,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget suggestionDetails() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 209, 191, 191),
            width: 1,
          ),
          color: const Color.fromARGB(255, 220, 246, 245),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                displayContent,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              subtitle: Text(
                "ETA : $displayETA",
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButtonWidget(
                  buttonContent: "Refill",
                ),
                OutlinedButton(
                    onPressed: () {
                      print("View Order Details");
                    },
                    child: const Text(
                      "Order Details",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
