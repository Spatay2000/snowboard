// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:snowboard/data/model/after_register_user_model.dart';
import 'package:snowboard/domain/entity/user_entity.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? clientId;
  String? avatarPath;
  String? fullName;
  String? phoneNumber;
  int? code;
  String? email;
  int? age;
  String? dateOfBirth;
  dynamic city;
  dynamic gender;
  bool? contractStatusType;
  String? contractPath;
  String? deviceId;
  String? accedToken;
  String? refreshToken;
  String? role;
  dynamic lastOrderDateTime;
  ManagerResponseModel? managerResponse;

  UserModel({
    required this.clientId,
    required this.avatarPath,
    required this.fullName,
    required this.phoneNumber,
    required this.code,
    required this.email,
    required this.age,
    required this.dateOfBirth,
    required this.city,
    required this.gender,
    required this.contractStatusType,
    required this.contractPath,
    required this.deviceId,
    required this.accedToken,
    required this.refreshToken,
    required this.role,
    required this.lastOrderDateTime,
    required this.managerResponse,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        clientId: json["clientId"],
        avatarPath: json["avatarPath"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        code: json["code"],
        email: json["email"],
        age: json["age"],
        dateOfBirth: json["dateOfBirth"],
        city: json["city"],
        gender: json["gender"],
        contractStatusType: json["contractStatusType"],
        contractPath: json["contractPath"],
        deviceId: json["deviceId"],
        accedToken: json["accedToken"],
        refreshToken: json["refreshToken"],
        role: json["role"],
        lastOrderDateTime: json["lastOrderDateTime"],
        managerResponse: ManagerResponseModel.fromJson(json["managerResponse"]),
      );

  Map<String, dynamic> toJson() => {
        "clientId": clientId,
        "avatarPath": avatarPath,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "code": code,
        "email": email,
        "age": age,
        "dateOfBirth": dateOfBirth,
        "city": city,
        "gender": gender,
        "contractStatusType": contractStatusType,
        "contractPath": contractPath,
        "deviceId": deviceId,
        "accedToken": accedToken,
        "refreshToken": refreshToken,
        "role": role,
        "lastOrderDateTime": lastOrderDateTime,
        "managerResponse": managerResponse!.toJson(),
      };

  factory UserModel.fromEntity(UserEntity userEntity) => UserModel(
        clientId: userEntity.clientId,
        avatarPath: userEntity.avatarPath,
        fullName: userEntity.fullName,
        phoneNumber: userEntity.phoneNumber,
        code: userEntity.code,
        email: userEntity.email,
        age: userEntity.age,
        dateOfBirth: userEntity.dateOfBirth,
        city: userEntity.city,
        gender: userEntity.gender,
        contractStatusType: userEntity.contractStatusType,
        contractPath: userEntity.contractPath,
        deviceId: userEntity.deviceId,
        accedToken: userEntity.accedToken,
        refreshToken: userEntity.refreshToken,
        role: userEntity.role,
        lastOrderDateTime: userEntity.lastOrderDateTime,
        managerResponse:
            ManagerResponseModel.fromEntity(userEntity.managerResponse!),
      );

  UserEntity toEntity() => UserEntity(
        clientId: clientId,
        avatarPath: avatarPath,
        fullName: fullName,
        phoneNumber: phoneNumber,
        code: code,
        email: email,
        age: age,
        dateOfBirth: dateOfBirth,
        city: city,
        gender: gender,
        contractStatusType: contractStatusType,
        contractPath: contractPath,
        deviceId: deviceId,
        accedToken: accedToken,
        refreshToken: refreshToken,
        role: role,
        lastOrderDateTime: lastOrderDateTime,
        managerResponse: managerResponse!.toEntity(),
      );
}
