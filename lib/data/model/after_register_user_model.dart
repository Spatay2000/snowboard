// To parse this JSON data, do
//
//     final afterRegisterUserModel = afterRegisterUserModelFromJson(jsonString);

import 'dart:convert';

import 'package:snowboard/domain/entity/after_register_user_entity.dart';

AfterRegisterUserModel afterRegisterUserModelFromJson(String str) =>
    AfterRegisterUserModel.fromJson(json.decode(str));

String afterRegisterUserModelToJson(AfterRegisterUserModel data) =>
    json.encode(data.toJson());

class AfterRegisterUserModel {
  String? userId;
  String? fullName;
  int? phoneNumber;
  int? code;
  String? email;
  String? role;
  ManagerResponseModel? managerResponse;

  AfterRegisterUserModel({
    required this.userId,
    required this.fullName,
    required this.phoneNumber,
    required this.code,
    required this.email,
    required this.role,
    required this.managerResponse,
  });

  factory AfterRegisterUserModel.fromJson(Map<String, dynamic> json) =>
      AfterRegisterUserModel(
        userId: json["userId"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        code: json["code"],
        email: json["email"],
        role: json["role"],
        managerResponse: ManagerResponseModel.fromJson(json["managerResponse"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "code": code,
        "email": email,
        "role": role,
        "managerResponse": managerResponse!.toJson(),
      };

  factory AfterRegisterUserModel.fromEntity(AfterUserEntity afterUserEntity) =>
      AfterRegisterUserModel(
          userId: afterUserEntity.userId,
          fullName: afterUserEntity.fullName,
          phoneNumber: afterUserEntity.phoneNumber,
          code: afterUserEntity.code,
          email: afterUserEntity.email,
          role: afterUserEntity.role,
          managerResponse: ManagerResponseModel.fromEntity(
              afterUserEntity.managerResponse!));

  AfterUserEntity toEntity() => AfterUserEntity(
      userId: userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      code: code,
      email: email,
      role: role,
      managerResponse: managerResponse!.toEntity());
}

class ManagerResponseModel {
  String? message;
  bool? isSuccess;
  dynamic errors;
  dynamic expireDate;

  ManagerResponseModel({
    required this.message,
    required this.isSuccess,
    required this.errors,
    required this.expireDate,
  });

  factory ManagerResponseModel.fromJson(Map<String, dynamic> json) =>
      ManagerResponseModel(
        message: json["message"],
        isSuccess: json["isSuccess"],
        errors: json["errors"],
        expireDate: json["expireDate"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "isSuccess": isSuccess,
        "errors": errors,
        "expireDate": expireDate,
      };

  factory ManagerResponseModel.fromEntity(
          ManagerResponseEntity managerResponseEntity) =>
      ManagerResponseModel(
          message: managerResponseEntity.message,
          isSuccess: managerResponseEntity.isSuccess,
          errors: managerResponseEntity.errors,
          expireDate: managerResponseEntity.expireDate);

  ManagerResponseEntity toEntity() => ManagerResponseEntity(
      message: message,
      isSuccess: isSuccess,
      errors: errors,
      expireDate: expireDate);
}
