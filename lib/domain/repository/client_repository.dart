import 'package:snowboard/domain/entity/after_register_user_entity.dart';

abstract class ClientRepository {
  Future<AfterUserEntity> register(
      {required String email,
      required String fullName,
      required String password,
      required String repeatPassword});

  Future<AfterUserEntity> registerPhoneNumber ({
    required String userId,
    required String phoneNumber,
  });
}
