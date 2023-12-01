import 'package:injectable/injectable.dart';
import 'package:snowboard/data/datasource/remote/client_remote_datasource.dart';
import 'package:snowboard/domain/entity/after_register_user_entity.dart';
import 'package:snowboard/domain/repository/client_repository.dart';

@LazySingleton(as: ClientRepository)
class ClientRepositoryImpl implements ClientRepository {
  final ClientRemoteDataSource clientRemoteDataSource;
  ClientRepositoryImpl(this.clientRemoteDataSource);

  @override
  Future<AfterUserEntity> register(
      {required String email,
      required String fullName,
      required String password,
      required String repeatPassword}) async {
    final user = await clientRemoteDataSource.register(
        email: email,
        fullName: fullName,
        password: password,
        repeatPassword: repeatPassword);
    return user.toEntity();
  }
}
