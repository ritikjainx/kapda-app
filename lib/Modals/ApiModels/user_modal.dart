import 'dart:convert';

class UserData {
  String id;
  String firstName;
  String lastName;
  String address;
  String phoneNumber;
  List<dynamic> favItems; // it is List<int> after json decode

  UserData({this.firstName, this.lastName, this.id, this.address, this.phoneNumber, this.favItems});

  factory UserData.fromjson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastname'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      favItems: jsonDecode(json['favItems']) ?? [],
    );
  }

  factory UserData.fromList(List<String> json) {
    return UserData(
      id: json[0],
      firstName: json[1],
      lastName: json[2],
      address: json[3],
      phoneNumber: json[4],
      favItems: jsonDecode(json[5]),
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'phoneNumber': phoneNumber,
      'favItems': favItems.toString(),
    };
  }
}
