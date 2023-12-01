import 'package:injectable/injectable.dart';
import 'package:snowboard/domain/entity/after_register_user_entity.dart';
import 'package:snowboard/domain/repository/client_repository.dart';
import 'package:snowboard/domain/usecase/base_usecase.dart';

@lazySingleton
class RegisterPhoneNumberUseCase
    extends UseCase<AfterUserEntity, RegisterPhoneNumberUseCaseParams> {
  final ClientRepository clientRepository;

  RegisterPhoneNumberUseCase({required this.clientRepository});

  @override
  Future<AfterUserEntity> call(RegisterPhoneNumberUseCaseParams params) async {
    return await clientRepository.registerPhoneNumber(
      userId: params.userId,
      phoneNumber: params.phoneNumber,
    );
  }
}

class RegisterPhoneNumberUseCaseParams {
  final String userId;
  final String phoneNumber;

  RegisterPhoneNumberUseCaseParams({
    required this.userId,
    required this.phoneNumber,
  });
}
