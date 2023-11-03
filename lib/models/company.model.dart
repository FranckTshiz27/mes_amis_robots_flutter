class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({name, catchPhrase, bs});

  Company.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        catchPhrase = json['catchPhrase'],
        bs = json['bs'];

  @override
  String toString() {
    return '($name : $catchPhrase : $bs )';
  }
}
