import 'package:injectable/injectable.dart';
import 'package:snowboard/domain/entity/user_entity.dart';
import 'package:snowboard/domain/repository/client_repository.dart';
import 'package:snowboard/domain/usecase/base_usecase.dart';

@lazySingleton
class VerificationCodeUseCase
    extends UseCase<UserEntity, VerificationCodeUseCaseParams> {
  final ClientRepository clientRepository;

  VerificationCodeUseCase({required this.clientRepository});

  @override
  Future<UserEntity> call(VerificationCodeUseCaseParams params) async {
    return await clientRepository.verificationCode(
      userId: params.userId,
      code: params.code,
    );
  }
}

class VerificationCodeUseCaseParams {
  final String userId;
  final int code;

  VerificationCodeUseCaseParams({
    required this.userId,
    required this.code,
  });
}
