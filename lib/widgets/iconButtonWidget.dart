import 'package:cpad_assignment/constants.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class IconButtonWidget extends StatelessWidget {
  final String buttonContent;
  final bool isBigButton;

  IconButtonWidget({
    required this.buttonContent,
    this.isBigButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Added to Cart",
          desc: "Items has been added to cart",
          buttons: [
            DialogButton(
              onPressed: () {
                // Navigator.pushNamedAndRemoveUntil(
                //     context, kDashBoard, (route) => false);
                // Navigator.maybePop(context);
                Navigator.pushNamed(context, kCartPage);
              },
              width: 120,
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      icon: Icon(
        Icons.shopping_cart_checkout,
        color: Colors.white,
        size: (isBigButton ? 40 : 20),
      ),
      label: Text(
        buttonContent,
        style: TextStyle(
          color: Colors.white,
          fontSize: isBigButton ? 30 : 20,
        ),
      ),
    );
  }
}
