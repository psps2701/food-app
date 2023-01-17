// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
  RegisterResponseModel({
   required this.success,
    required this.data,
    required this.runningOrder,
  });

  bool success;
  Data data;
  dynamic runningOrder;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
    success: json["success"] ?? "",
    data: Data.fromJson(json["data"] ?? {"": ""}),
    runningOrder: json["running_order"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "running_order": runningOrder,
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
  });

  int id;
  String authToken;
  String name;
  String email;
  String phone;
  String defaultAddressId;
  String defaultAddress;
  int walletBalance;
  String avatar;
  String taxNumber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? "",
    authToken: json["auth_token"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    phone: json["phone"] ?? "",
    defaultAddressId: json["default_address_id"] ?? "",
    defaultAddress: json["default_address"] ?? "",
    walletBalance: json["wallet_balance"] ?? "",
    avatar: json["avatar"] ?? "",
    taxNumber: json["tax_number"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "auth_token": authToken,
    "name": name,
    "email": email,
    "phone": phone,
    "default_address_id": defaultAddressId,
    "default_address": defaultAddress,
    "wallet_balance": walletBalance,
    "avatar": avatar,
    "tax_number": taxNumber,
  };
}
