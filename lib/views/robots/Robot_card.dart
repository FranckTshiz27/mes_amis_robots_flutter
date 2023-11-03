import 'package:flutter/material.dart';
import 'package:mes_amis_robots/views/detail/robot_detail.dart';

import '../../models/user.model.dart';

class RobotCard extends StatelessWidget {
  final User user;

  RobotCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    const String urlImg = "https://robohash.org/";
    print('$urlImg${user.id}');
    return Container(
      color: const Color.fromARGB(255, 35, 149, 241),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      height: 250,
      width: 60,
      child: Column(
        children: [
          Image(
            image: NetworkImage('$urlImg${user.id}'),
            fit: BoxFit.cover,
            height: 100,
            width: 50,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            user.name!,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, RobotDetail.routName,
                arguments: user),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 70, 87, 245),
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(left: 20, bottom: 0, right: 20, top: 0),
              ),
            ),
            child: const Text(
              "Plus de détails",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
          // Center(
          //   child: TextButto
          //       onPressed: () {}, child: const Text("Voir plus de détails !")),
          // )
        ],
      ),
    );
  }
}
