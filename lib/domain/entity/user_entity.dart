import 'package:snowboard/domain/entity/after_register_user_entity.dart';

class UserEntity {
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
  ManagerResponseEntity? managerResponse;

  UserEntity({
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

  UserEntity copyWith({
    String? clientId,
    dynamic avatarPath,
    String? fullName,
    String? phoneNumber,
    int? code,
    String? email,
    dynamic age,
    dynamic dateOfBirth,
    dynamic city,
    dynamic gender,
    bool? contractStatusType,
    dynamic contractPath,
    dynamic deviceId,
    dynamic accedToken,
    dynamic refreshToken,
    String? role,
    dynamic lastOrderDateTime,
    ManagerResponseEntity? managerResponse,
  }) =>
      UserEntity(
        clientId: clientId ?? this.clientId,
        avatarPath: avatarPath ?? this.avatarPath,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        code: code ?? this.code,
        email: email ?? this.email,
        age: age ?? this.age,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        city: city ?? this.city,
        gender: gender ?? this.gender,
        contractStatusType: contractStatusType ?? this.contractStatusType,
        contractPath: contractPath ?? this.contractPath,
        deviceId: deviceId ?? this.deviceId,
        accedToken: accedToken ?? this.accedToken,
        refreshToken: refreshToken ?? this.refreshToken,
        role: role ?? this.role,
        lastOrderDateTime: lastOrderDateTime ?? this.lastOrderDateTime,
        managerResponse: managerResponse ?? this.managerResponse,
      );
}
