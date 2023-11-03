import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mes_amis_robots/models/user.model.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  UnmodifiableListView<User> get users => UnmodifiableListView(_users);

  Future<void> fetchData() async {
    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    _users = (json.decode(response.body) as List)
        .map((userJson) => User.fromJson(userJson))
        .toList();

    // notifyListeners();
  }
}
