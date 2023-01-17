// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel? data) => json.encode(data!.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.data,
    required this.success,
    required this.message,
  });

  Data? data;
  bool? success;
  String? message;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    data: Data.fromJson(json["data"]),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "success": success,
    "message": message,
  };
}

class Data {
  Data({
    required this.id,
    required this.authToken,
    required this.name,
    required this.email,
    required this.phone,
    required this.defaultAddressId,
    required this.defaultAddress,
    required this.walletBalance,
    required this.avatar,
    required this.taxNumber,
    required  this.runningOrder,
  });

  int? id;
  String? authToken;
  String? name;
  String? email;
  String? phone;
  int? defaultAddressId;
  DefaultAddress? defaultAddress;
  int? walletBalance;
  String? avatar;
  String? taxNumber;
  String? runningOrder;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    authToken: json["auth_token"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    defaultAddressId: json["default_address_id"],
    defaultAddress: DefaultAddress.fromJson(json["default_address"]),
    walletBalance: json["wallet_balance"],
    avatar: json["avatar"],
    taxNumber: json["tax_number"],
    runningOrder: json["running_order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "auth_token": authToken,
    "name": name,
    "email": email,
    "phone": phone,
    "default_address_id": defaultAddressId,
    "default_address": defaultAddress!.toJson(),
    "wallet_balance": walletBalance,
    "avatar": avatar,
    "tax_number": taxNumber,
    "running_order": runningOrder,
  };
}

class DefaultAddress {
  DefaultAddress({
    this.address,
    this.house,
    this.latitude,
    this.longitude,
    this.tag,
  });

  String? address;
  String? house;
  String? latitude;
  String? longitude;
  String? tag;

  factory DefaultAddress.fromJson(Map<String, dynamic> json) => DefaultAddress(
    address: json["address"],
    house: json["house"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "house": house,
    "latitude": latitude,
    "longitude": longitude,
    "tag": tag,
  };
}