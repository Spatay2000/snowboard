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
import 'package:snowboard/core/shared/http.dart' as _i10;
import 'package:snowboard/core/shared/http_client_impl.dart' as _i11;
import 'package:snowboard/core/utils/navigation_service.dart' as _i7;
import 'package:snowboard/data/datasource/remote/client_remote_datasource.dart'
    as _i12;
import 'package:snowboard/data/repository/client_repository_impl.dart' as _i14;
import 'package:snowboard/domain/repository/client_repository.dart' as _i13;
import 'package:snowboard/domain/usecase/login_usecase.dart' as _i15;
import 'package:snowboard/domain/usecase/register_phone_number_usecase.dart'
    as _i16;
import 'package:snowboard/domain/usecase/register_usecase.dart' as _i17;
import 'package:snowboard/domain/usecase/shared_preferences/if_token_exists_usecase.dart'
    as _i5;
import 'package:snowboard/domain/usecase/shared_preferences/remove_token_usecase.dart'
    as _i8;
import 'package:snowboard/domain/usecase/shared_preferences/save_token_usecase.dart'
    as _i9;
import 'package:snowboard/domain/usecase/verification_code_usecase.dart'
    as _i19;
import 'package:snowboard/features/index_skibo/bloc/index_skibo_bloc.dart'
    as _i6;
import 'package:snowboard/features/login/bloc/login_bloc.dart' as _i20;
import 'package:snowboard/features/registration/phone_number_bloc/bloc/phone_number_register_bloc.dart'
    as _i21;
import 'package:snowboard/features/registration/registration_bloc/bloc/registration_bloc.dart'
    as _i18;
import 'package:snowboard/features/registration/verification_bloc/bloc/verification_bloc.dart'
    as _i22;

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
    gh.lazySingleton<_i5.IfTokenExistsUseCase>(
        () => _i5.IfTokenExistsUseCase(cache: gh<_i3.Cache>()));
    gh.factory<_i6.IndexSkiboBloc>(() => _i6.IndexSkiboBloc());
    gh.lazySingleton<_i7.NavigationService>(() => _i7.NavigationService());
    gh.lazySingleton<_i8.RemoveTokenUseCase>(
        () => _i8.RemoveTokenUseCase(cache: gh<_i3.Cache>()));
    gh.lazySingleton<_i9.SaveTokenUseCase>(
        () => _i9.SaveTokenUseCase(cache: gh<_i3.Cache>()));
    gh.factory<_i10.Http>(() => _i11.HttpImpl(
          cache: gh<_i3.Cache>(),
          navigationService: gh<_i7.NavigationService>(),
        ));
    gh.lazySingleton<_i12.ClientRemoteDataSource>(
        () => _i12.ClientRemoteDataSourceImpl(http: gh<_i10.Http>()));
    gh.lazySingleton<_i13.ClientRepository>(
        () => _i14.ClientRepositoryImpl(gh<_i12.ClientRemoteDataSource>()));
    gh.lazySingleton<_i15.LoginUseCase>(
        () => _i15.LoginUseCase(clientRepository: gh<_i13.ClientRepository>()));
    gh.lazySingleton<_i16.RegisterPhoneNumberUseCase>(() =>
        _i16.RegisterPhoneNumberUseCase(
            clientRepository: gh<_i13.ClientRepository>()));
    gh.lazySingleton<_i17.RegisterUseCase>(() =>
        _i17.RegisterUseCase(clientRepository: gh<_i13.ClientRepository>()));
    gh.factory<_i18.RegistrationBloc>(
        () => _i18.RegistrationBloc(gh<_i17.RegisterUseCase>()));
    gh.lazySingleton<_i19.VerificationCodeUseCase>(() =>
        _i19.VerificationCodeUseCase(
            clientRepository: gh<_i13.ClientRepository>()));
    gh.factory<_i20.LoginBloc>(() => _i20.LoginBloc(
          authUsecase: gh<_i15.LoginUseCase>(),
          saveTokenUseCase: gh<_i9.SaveTokenUseCase>(),
        ));
    gh.factory<_i21.PhoneNumberRegisterBloc>(() =>
        _i21.PhoneNumberRegisterBloc(gh<_i16.RegisterPhoneNumberUseCase>()));
    gh.factory<_i22.VerificationBloc>(
        () => _i22.VerificationBloc(gh<_i19.VerificationCodeUseCase>()));
    return this;
  }
}
