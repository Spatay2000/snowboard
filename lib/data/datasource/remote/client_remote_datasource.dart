import 'package:injectable/injectable.dart';
import 'package:snowboard/core/shared/http.dart';
import 'package:snowboard/data/model/after_register_user_model.dart';

abstract class ClientRemoteDataSource {
  Future<AfterRegisterUserModel> register(
      {required String email,
      required String fullName,
      required String password,
      required String repeatPassword});
}

@LazySingleton(as: ClientRemoteDataSource)
class ClientRemoteDataSourceImpl implements ClientRemoteDataSource {
  final Http http;
  const ClientRemoteDataSourceImpl({
    required this.http,
  });

  @override
  Future<AfterRegisterUserModel> register(
      {required String email,
      required String fullName,
      required String password,
      required String repeatPassword}) async {
    final user = await http.post(
        '/api/Auth/register?email=$email&fullName=$fullName&password=$password&confirmPassword=$repeatPassword',
        body: {});
    return AfterRegisterUserModel.fromJson(user);
  }
}
