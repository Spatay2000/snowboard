import 'package:injectable/injectable.dart';
import 'package:snowboard/core/constants/cache_keys.dart';

import '../../../core/shared/cache.dart';
import '../base_usecase.dart';


@lazySingleton
class RemoveTokenUseCase implements UseCase<void, NoParams> {
  final Cache cache;

  const RemoveTokenUseCase({
    required this.cache,
  });

  @override
  Future<void> call(NoParams params) async {
    return await cache.remove(CacheKeys.token);
  }
}
