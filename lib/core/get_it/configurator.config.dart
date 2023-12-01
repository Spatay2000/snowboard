// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:snowboard/core/shared/cache.dart' as _i3;
import 'package:snowboard/core/shared/cache_impl.dart' as _i4;
import 'package:snowboard/core/shared/http.dart' as _i7;
import 'package:snowboard/core/shared/http_client_impl.dart' as _i8;
import 'package:snowboard/core/utils/navigation_service.dart' as _i6;
import 'package:snowboard/data/datasource/remote/client_remote_datasource.dart'
    as _i9;
import 'package:snowboard/data/repository/client_repository_impl.dart' as _i11;
import 'package:snowboard/domain/repository/client_repository.dart' as _i10;
import 'package:snowboard/domain/usecase/register_usecase.dart' as _i12;
import 'package:snowboard/features/index_skibo/bloc/index_skibo_bloc.dart'
    as _i5;
import 'package:snowboard/features/registration/registration_bloc/bloc/registration_bloc.dart'
    as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.Cache>(() => _i4.CacheImpl());
    gh.factory<_i5.IndexSkiboBloc>(() => _i5.IndexSkiboBloc());
    gh.lazySingleton<_i6.NavigationService>(() => _i6.NavigationService());
    gh.factory<_i7.Http>(() => _i8.HttpImpl(
          cache: gh<_i3.Cache>(),
          navigationService: gh<_i6.NavigationService>(),
        ));
    gh.lazySingleton<_i9.ClientRemoteDataSource>(
        () => _i9.ClientRemoteDataSourceImpl(http: gh<_i7.Http>()));
    gh.lazySingleton<_i10.ClientRepository>(
        () => _i11.ClientRepositoryImpl(gh<_i9.ClientRemoteDataSource>()));
    gh.lazySingleton<_i12.RegisterUseCase>(() =>
        _i12.RegisterUseCase(clientRepository: gh<_i10.ClientRepository>()));
    gh.factory<_i13.RegistrationBloc>(
        () => _i13.RegistrationBloc(gh<_i12.RegisterUseCase>()));
    return this;
  }
}
