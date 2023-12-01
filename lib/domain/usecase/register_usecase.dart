import 'package:injectable/injectable.dart';
import 'package:snowboard/domain/entity/after_register_user_entity.dart';
import 'package:snowboard/domain/repository/client_repository.dart';
import 'package:snowboard/domain/usecase/base_usecase.dart';

@lazySingleton
class RegisterUseCase extends UseCase<AfterUserEntity, RegisterUseCaseParams> {
  final ClientRepository clientRepository;

  RegisterUseCase({required this.clientRepository});

  @override
  Future<AfterUserEntity> call(RegisterUseCaseParams params) async {
    return await clientRepository.register(
      email: params.email,
      fullName: params.fullName,
      password: params.password,
      repeatPassword: params.repeatPassword,
    );
  }
}

class RegisterUseCaseParams {
  final String email;
  final String fullName;
  final String password;
  final String repeatPassword;

  RegisterUseCaseParams({
    required this.email,
    required this.fullName,
    required this.password,
    required this.repeatPassword,
  });
}
