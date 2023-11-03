import 'package:flutter/material.dart';
import 'package:mes_amis_robots/models/address.model.dart';
import 'package:mes_amis_robots/models/company.model.dart';
import 'package:mes_amis_robots/models/user.model.dart';

class RobotDetail extends StatelessWidget {
  static const String routName = "/detail";

  const RobotDetail({super.key});

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 93, 154, 245),
        title: Text(
          user.name!,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 25,
          )
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 93, 154, 245),
        // padding: const EdgeInsets.only(top: 10),
        // width: 100,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              " Addresse ",
              style: TextStyle(
                  color: Color.fromARGB(255, 70, 87, 245),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              user.address!.city!,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              user.address!.street!,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              user.address!.suite!,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              user.address!.zipcode!,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              " Compagnie ",
              style: TextStyle(
                  color: Color.fromARGB(255, 70, 87, 245),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              user.company!.name!,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              user.company!.catchPhrase!,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              user.company!.bs!,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
