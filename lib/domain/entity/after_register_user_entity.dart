class AfterUserEntity {
  String? userId;
  String? fullName;
  int? phoneNumber;
  int? code;
  String? email;
  String? role;
  ManagerResponseEntity? managerResponse;

  AfterUserEntity({
    required this.userId,
    required this.fullName,
    required this.phoneNumber,
    required this.code,
    required this.email,
    required this.role,
    required this.managerResponse,
  });

  AfterUserEntity copyWith({
    String? userId,
    String? fullName,
    int? phoneNumber,
    int? code,
    String? email,
    String? role,
    ManagerResponseEntity? managerResponse,
  }) =>
      AfterUserEntity(
        userId: userId ?? this.userId,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        code: code ?? this.code,
        email: email ?? this.email,
        role: role ?? this.role,
        managerResponse: managerResponse ?? this.managerResponse,
      );
}

class ManagerResponseEntity {
  String? message;
  bool? isSuccess;
  dynamic errors;
  dynamic expireDate;

  ManagerResponseEntity({
    required this.message,
    required this.isSuccess,
    required this.errors,
    required this.expireDate,
  });

  ManagerResponseEntity copyWith({
    String? message,
    bool? isSuccess,
    dynamic errors,
    dynamic expireDate,
  }) =>
      ManagerResponseEntity(
        message: message ?? this.message,
        isSuccess: isSuccess ?? this.isSuccess,
        errors: errors ?? this.errors,
        expireDate: expireDate ?? this.expireDate,
      );
}
