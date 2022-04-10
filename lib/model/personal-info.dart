import 'dart:convert';

class PersonalIfo {
  String phone;
  String gender;
  String nationality;
  String address;
  String residenceNumber;
  String residenceExpiry;
  String passportNumber;
  String passportExpiry;
  String licenseNumber;
  String licenseType;
  String licenseExpiry;

  PersonalIfo({
    required this.phone,
    required this.gender,
    required this.nationality,
    required this.address,
    required this.residenceNumber,
    required this.residenceExpiry,
    required this.passportNumber,
    required this.passportExpiry,
    required this.licenseNumber,
    required this.licenseType,
    required this.licenseExpiry,
  });
  factory PersonalIfo.fromMap(Map<String, dynamic> map) => PersonalIfo(
        phone: map['phone'] ?? "Not set yet",
        gender: map['gender'] ?? "Not set yet",
        nationality: map['nationality'] ?? "Not set yet",
        address: map['address'] ?? "Not set yet",
        residenceNumber: map['residence_number'] ?? "Not set yet",
        residenceExpiry: map['residence_expiry'] ?? "Not set yet",
        passportNumber: map['passport_number'] ?? "Not set yet",
        passportExpiry: map['passport_expiry'] ?? "Not set yet",
        licenseNumber: map['license_number'] ?? "Not set yet",
        licenseType: map['license_type'] ?? "Not set yet",
        licenseExpiry: map['license_expiry'] ?? "Not set yet",
      );
  factory PersonalIfo.fromJson(String source) =>
      PersonalIfo.fromMap(json.decode(source));
}
