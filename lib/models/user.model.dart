import 'package:mes_amis_robots/models/address.model.dart';
import 'package:mes_amis_robots/models/company.model.dart';

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  Address? address;
  Company? company;

  User({id, name, username, email, phone, website});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        phone = json['phone'],
        website = json['website'],
        address = Address.fromJson(json['address']),
        company = Company.fromJson(json['company']);

  @override
  String toString() {
    return '($name : $username : $email : $phone : $website : address ${address} : company ${company})';
  }
}
