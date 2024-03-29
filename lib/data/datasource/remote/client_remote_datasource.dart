import 'package:injectable/injectable.dart';
import 'package:snowboard/core/shared/http.dart';
import 'package:snowboard/data/model/after_register_user_model.dart';
import 'package:snowboard/data/model/user_model.dart';

abstract class ClientRemoteDataSource {
  Future<AfterRegisterUserModel> register(
      {required String email,
      required String fullName,
      required String password,
      required String repeatPassword});

  Future<AfterRegisterUserModel> registerPhoneNumber({
    required String userId,
    required String phoneNumber,
  });

  Future<UserModel> verificationCode({
    required String userId,
    required int code,
  });

  Future<UserModel> login({
    required String email,
    required String password,
    required String deviceId,
  });
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

  @override
  Future<AfterRegisterUserModel> registerPhoneNumber(
      {required String userId, required String phoneNumber}) async {
    final user = await http.post(
        '/api/Auth/verificationPhoneSmsAsync?id=$userId&phone=$phoneNumber');
    return AfterRegisterUserModel.fromJson(user);
  }

  @override
  Future<UserModel> verificationCode(
      {required String userId, required int code}) async {
    final user = await http
        .post('/api/Auth/verificationCodeSmsAsync?id=$userId&code=$code');
    return UserModel.fromJson(user);
  }

  @override
  Future<UserModel> login(
      {required String email,
      required String password,
      required String deviceId}) async {
    final user = await http.post(
        '/api/Auth/login?email=$email&password=$password&deviceId=$deviceId');
    return UserModel.fromJson(user);
  }
}
