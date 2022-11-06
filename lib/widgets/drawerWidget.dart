import 'package:cpad_assignment/constants.dart';
import 'package:cpad_assignment/services/networking.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(kAppImage),
                  ),
                ),
              ),
              Text(
                kAppTitle,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const Divider(),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(kDashBoard),
            leading: const Icon(Icons.dashboard),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.popAndPushNamed(context, kDashBoardPage);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Order Medicine"),
            leading: const Icon(Icons.medical_services),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () async {
              Navigator.popAndPushNamed(context, kOrderMedicinePage,
                  arguments: await DataConverter().getOrderDetails());
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(kBookDoctorApp),
            leading: const Icon(Icons.medical_information),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.popAndPushNamed(context, kUnderConstructionPage);
            },
          ),
          ListTile(
            title: const Text(kBookLab),
            leading: const Icon(Icons.vaccines),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.popAndPushNamed(context, kUnderConstructionPage);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(kCart),
            leading: const Icon(Icons.shopping_cart),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.popAndPushNamed(context, kCartPage);
            },
          ),
        ],
      ),
    );
  }
}
