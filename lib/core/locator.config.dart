// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:numeroid/core/locator.dart' as _i366;
import 'package:numeroid/domain/bloc/app/app_bloc.dart' as _i363;
import 'package:numeroid/domain/bloc/search/search_bloc.dart' as _i470;
import 'package:numeroid/domain/database/database.dart' as _i675;
import 'package:numeroid/domain/network/network_service.dart' as _i607;
import 'package:numeroid/widgets/kit/app_theme.dart' as _i784;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i784.AppTheme>(() => registerModule.appTheme);
    gh.singleton<_i607.NetworkService>(
        () => registerModule.unauthNetworkService);
    gh.singleton<_i607.AuthNetworkService>(
        () => registerModule.authNetworkService);
    gh.singleton<_i470.SearchBloc>(() => registerModule.searchBloc);
    gh.singleton<_i363.AppBloc>(() => registerModule.appBloc);
    gh.singleton<_i675.DataBase>(() => registerModule.db);
    return this;
  }
}

class _$RegisterModule extends _i366.RegisterModule {}
