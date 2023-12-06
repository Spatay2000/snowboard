import 'package:injectable/injectable.dart';
import 'package:snowboard/domain/entity/user_entity.dart';
import 'package:snowboard/domain/repository/client_repository.dart';
import 'package:snowboard/domain/usecase/base_usecase.dart';

@lazySingleton
class LoginUseCase extends UseCase<UserEntity, LoginUseCaseParams> {
  final ClientRepository clientRepository;

  LoginUseCase({required this.clientRepository});

  @override
  Future<UserEntity> call(LoginUseCaseParams params) async {
    return await clientRepository.login(
      email: params.email,
      password: params.password,
      deviceId: params.deviceId,
    );
  }
}

class LoginUseCaseParams {
  final String email;
  final String password;
  final String deviceId;

  LoginUseCaseParams(
      {required this.email, required this.password, required this.deviceId});
}
