import 'package:flutter/material.dart';
import 'package:mes_amis_robots/providers/UserProvider.dart';
import 'package:mes_amis_robots/views/robots/Robot_card.dart';
import 'package:mes_amis_robots/widgets/loader.dart';
import 'package:provider/provider.dart';

import '../../models/user.model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _userState();
}

class _userState extends State<HomePage> {
  List<User> users = [];
  List<User> filteredUsers = [];
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    // getData();
    filteredUsers.addAll(users);
    _controller.addListener(_onSearchChanged);
    // filteredUsers.addAll(users);
  }

  _onSearchChanged() {
    filter();
  }

  filter() {
    var usersToShow = [];
    if (_controller.text != "") {
      usersToShow = users
          .where((user) =>
              user.name!.toLowerCase().contains(_controller.text.toLowerCase()))
          .toList();
    } else {
      usersToShow = users;
    }
    setState(() {
      filteredUsers = List.from(usersToShow);
    });
  }

  getData() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.fetchData();
    if (users.isEmpty) {
      setState(() {
        users = userProvider.users;
        print(users);
        filteredUsers.addAll(users);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // filteredUsers.addAll(users);
    getData();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 93, 154, 245),
      appBar: AppBar(
        title: const Text(
          "MES AMIS ROBOTS",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 93, 154, 245),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                style: const TextStyle(
                    decorationStyle: TextDecorationStyle.dashed),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1)),
                  hintText: 'Rechercher un robot par son nom!',
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(Icons.search, color: Colors.white),
                ),
                // onChanged: (String value) {
                //   filter(value);
                // },
              ),
            ),
            // SingleChildScrollView(child: ,)
            Expanded(
                child: users.isEmpty
                    ? const Loader()
                    : Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: _controller.text == ""
                              ? users.length
                              : filteredUsers.length,
                          itemBuilder: (context, i) {
                            User user = _controller.text == ""
                                ? users[i]
                                : filteredUsers[i];
                            // return ListTile(
                            //   title: Text(
                            //     user.name!,
                            //     style: const TextStyle(color: Colors.white, fontSize: 12),
                            //   ),
                            // );

                            return RobotCard(
                              user: user,
                            );
                          },
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
