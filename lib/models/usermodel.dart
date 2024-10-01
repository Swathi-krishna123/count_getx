class Usermodel {
  String? name, address;
  int? age, phone, id;
  Usermodel({this.name, this.age, this.address, this.phone, this.id});

  factory Usermodel.fromjson(Map<String, dynamic> json) {
    return Usermodel(
        name: json["name"],
        address: json["address"],
        age: json["age"],
        phone: json["phone"],
        id: json["id"]);
  }

  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "address": address,
      "age": age,
      "phone": phone,
      "id": id,
    };
  }
}
