import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:snowboard/core/constants/cache_keys.dart';

import '../../../core/shared/cache.dart';
import '../base_usecase.dart';

class SaveTokenUseCaseParams {
  final String token;

  const SaveTokenUseCaseParams({
    required this.token,
  });
}

@lazySingleton
class SaveTokenUseCase implements UseCase<void, SaveTokenUseCaseParams> {
  final Cache cache;

  const SaveTokenUseCase({
    required this.cache,
  });

  @override
  Future<void> call(SaveTokenUseCaseParams params) async {
    log(' Future<void> call(SaveTokenUseCaseParams params) async');
    return await cache.setString(CacheKeys.token, params.token);
  }
}
