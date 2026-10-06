class CreateAccountModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String address;

  CreateAccountModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.address,

});

  Map<String, dynamic> toJson() {
    return {
     "firstName": firstName,
     "lastName": lastName,
     "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "address": address,
    };
  }

}