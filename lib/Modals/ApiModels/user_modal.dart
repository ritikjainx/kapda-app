class User {
  String id;
  String firstName;
  String lastName;
  String address;
  String phoneNumber;

  User({this.firstName, this.lastName, this.id, this.address, this.phoneNumber});

  factory User.fromjson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastname'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }
}
