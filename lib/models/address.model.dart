class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;

  Address({this.street, this.suite, this.city, this.zipcode});

  Address.fromJson(Map<String, dynamic> json)
      : street = json['street'],
        suite = json['suite'],
        city = json['city'],
        zipcode = json['zipcode'];

  @override
  String toString() {
    return '($street : $suite : $city : $zipcode )';
  }
}
