import 'package:injectable/injectable.dart';
import 'package:snowboard/core/constants/cache_keys.dart';

import '../../../core/shared/cache.dart';
import '../base_usecase.dart';


@lazySingleton
class IfTokenExistsUseCase implements UseCase<bool, NoParams> {
  final Cache cache;

  const IfTokenExistsUseCase({
    required this.cache,
  });

  @override
  Future<bool> call(NoParams params) async {
    return await cache.getString(CacheKeys.token) == null ? false : true;
  }
}
