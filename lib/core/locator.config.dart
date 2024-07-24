// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:numeroid/core/locator.dart' as _i8;
import 'package:numeroid/domain/bloc/app/app_bloc.dart' as _i6;
import 'package:numeroid/domain/bloc/search/search_bloc.dart' as _i5;
import 'package:numeroid/domain/database/database.dart' as _i7;
import 'package:numeroid/domain/network/network_service.dart' as _i4;
import 'package:numeroid/widgets/kit/app_theme.dart' as _i3;

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
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AppTheme>(() => registerModule.appTheme);
    gh.singleton<_i4.NetworkService>(() => registerModule.unauthNetworkService);
    gh.singleton<_i4.AuthNetworkService>(
        () => registerModule.authNetworkService);
    gh.singleton<_i5.SearchBloc>(() => registerModule.searchBloc);
    gh.singleton<_i6.AppBloc>(() => registerModule.appBloc);
    gh.singleton<_i7.DataBase>(() => registerModule.db);
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
