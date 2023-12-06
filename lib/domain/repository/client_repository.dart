import 'package:snowboard/domain/entity/after_register_user_entity.dart';
import 'package:snowboard/domain/entity/user_entity.dart';

abstract class ClientRepository {
  Future<AfterUserEntity> register(
      {required String email,
      required String fullName,
      required String password,
      required String repeatPassword});

  Future<AfterUserEntity> registerPhoneNumber({
    required String userId,
    required String phoneNumber,
  });

  Future<UserEntity> verificationCode({
    required String userId,
    required int code,
  });

  Future<UserEntity> login({
    required String email,
    required String password,
    required String deviceId,
  });
}
