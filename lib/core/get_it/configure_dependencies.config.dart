// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i12;
import 'package:smart_money/core/cache/base_custom_cache_manager.dart' as _i3;
import 'package:smart_money/core/firebase/database/firebase_store_database.dart'
    as _i6;
import 'package:smart_money/core/get_it/register_module.dart' as _i30;
import 'package:smart_money/core/internet/internet_connection_observer.dart'
    as _i10;
import 'package:smart_money/core/local_storage/base_secure_storage.dart'
    as _i13;
import 'package:smart_money/core/local_storage/base_shared_preference.dart'
    as _i14;
import 'package:smart_money/core/route/go_router_provider.dart' as _i8;
import 'package:smart_money/features/authentication/bloc/authentication_bloc.dart'
    as _i27;
import 'package:smart_money/features/authentication/usecase/create_user_usecase.dart'
    as _i17;
import 'package:smart_money/features/authentication/usecase/post_login_usecase.dart'
    as _i11;
import 'package:smart_money/features/example/bloc/example_bloc.dart' as _i5;
import 'package:smart_money/features/income_expenses/bloc/income_expenses_bloc.dart'
    as _i28;
import 'package:smart_money/features/income_expenses/usecase/add_cash_usecase.dart'
    as _i26;
import 'package:smart_money/features/income_expenses/usecase/create_income_expenses_usecase.dart'
    as _i15;
import 'package:smart_money/features/income_expenses/usecase/delete_income_expenses_useacase.dart'
    as _i18;
import 'package:smart_money/features/income_expenses/usecase/read_income_expenses_usecase.dart'
    as _i20;
import 'package:smart_money/features/income_expenses/usecase/update_income_expenses_usecase.dart'
    as _i24;
import 'package:smart_money/features/saving/bloc/saving_bloc.dart' as _i29;
import 'package:smart_money/features/saving/usecase/create_saving_usecase.dart'
    as _i16;
import 'package:smart_money/features/saving/usecase/delete_saving_useacase.dart'
    as _i19;
import 'package:smart_money/features/saving/usecase/read_saving_usecase.dart'
    as _i21;
import 'package:smart_money/features/saving/usecase/update_saving_usecase.dart'
    as _i25;
import 'package:smart_money/features/summarize/bloc/summary_bloc.dart' as _i23;
import 'package:smart_money/features/summarize/usecase/read_summary_usecase.dart'
    as _i22;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.BaseCustomCacheManager>(_i3.BaseCustomCacheManager());
    gh.factory<_i4.Connectivity>(() => registerModule.connectivity);
    gh.factory<_i5.ExampleBloc>(() => _i5.ExampleBloc());
    gh.singleton<_i6.FirebaseStoreDatabase>(_i6.FirebaseStoreDatabase());
    gh.factory<_i7.FlutterSecureStorage>(() => registerModule.secureStorage);
    gh.singleton<_i8.GoRouterProvider>(_i8.GoRouterProvider());
    gh.factory<_i9.InternetConnectionChecker>(
        () => registerModule.internetConnectionChecker);
    gh.singleton<_i10.InternetConnectionObserver>(
        _i10.InternetConnectionObserver(
      gh<_i9.InternetConnectionChecker>(),
      gh<_i4.Connectivity>(),
    ));
    gh.factory<_i11.PostLoginUseCase>(
        () => _i11.PostLoginUseCase(gh<_i6.FirebaseStoreDatabase>()));
    await gh.factoryAsync<_i12.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i13.BaseSecureStorage>(
        _i13.BaseSecureStorage(gh<_i7.FlutterSecureStorage>()));
    gh.singleton<_i14.BaseSharedPreference>(
        _i14.BaseSharedPreference(gh<_i12.SharedPreferences>()));
    gh.factory<_i15.CreateIncomeExpensesUseCase>(
        () => _i15.CreateIncomeExpensesUseCase(
              gh<_i6.FirebaseStoreDatabase>(),
              gh<_i14.BaseSharedPreference>(),
            ));
    gh.factory<_i16.CreateSavingUseCase>(() => _i16.CreateSavingUseCase(
          gh<_i6.FirebaseStoreDatabase>(),
          gh<_i14.BaseSharedPreference>(),
        ));
    gh.factory<_i17.CreateUserUsecase>(
        () => _i17.CreateUserUsecase(gh<_i6.FirebaseStoreDatabase>()));
    gh.factory<_i18.DeleteIncomeExpensesUseCase>(
        () => _i18.DeleteIncomeExpensesUseCase(
              gh<_i6.FirebaseStoreDatabase>(),
              gh<_i14.BaseSharedPreference>(),
            ));
    gh.factory<_i19.DeleteSavingListUseCase>(() => _i19.DeleteSavingListUseCase(
          gh<_i6.FirebaseStoreDatabase>(),
          gh<_i14.BaseSharedPreference>(),
        ));
    gh.factory<_i20.ReadIncomeExpensesUseCase>(
        () => _i20.ReadIncomeExpensesUseCase(
              gh<_i6.FirebaseStoreDatabase>(),
              gh<_i14.BaseSharedPreference>(),
            ));
    gh.factory<_i21.ReadSavingListUseCase>(() => _i21.ReadSavingListUseCase(
          gh<_i6.FirebaseStoreDatabase>(),
          gh<_i14.BaseSharedPreference>(),
        ));
    gh.factory<_i22.ReadSummaryUseCase>(() => _i22.ReadSummaryUseCase(
          gh<_i6.FirebaseStoreDatabase>(),
          gh<_i14.BaseSharedPreference>(),
        ));
    gh.factory<_i23.SummaryBloc>(
        () => _i23.SummaryBloc(gh<_i22.ReadSummaryUseCase>()));
    gh.factory<_i24.UpdateIncomeExpensesUseCase>(
        () => _i24.UpdateIncomeExpensesUseCase(
              gh<_i6.FirebaseStoreDatabase>(),
              gh<_i14.BaseSharedPreference>(),
            ));
    gh.factory<_i25.UpdateSavingListUseCase>(() => _i25.UpdateSavingListUseCase(
          gh<_i6.FirebaseStoreDatabase>(),
          gh<_i14.BaseSharedPreference>(),
        ));
    gh.factory<_i26.AddCashUseCase>(() => _i26.AddCashUseCase(
          gh<_i6.FirebaseStoreDatabase>(),
          gh<_i14.BaseSharedPreference>(),
        ));
    gh.factory<_i27.AuthenticationBloc>(() => _i27.AuthenticationBloc(
          gh<_i11.PostLoginUseCase>(),
          gh<_i14.BaseSharedPreference>(),
          gh<_i17.CreateUserUsecase>(),
        ));
    gh.factory<_i28.IncomeExpensesBloc>(() => _i28.IncomeExpensesBloc(
          gh<_i26.AddCashUseCase>(),
          gh<_i20.ReadIncomeExpensesUseCase>(),
          gh<_i18.DeleteIncomeExpensesUseCase>(),
          gh<_i24.UpdateIncomeExpensesUseCase>(),
          gh<_i15.CreateIncomeExpensesUseCase>(),
        ));
    gh.factory<_i29.SavingBloc>(() => _i29.SavingBloc(
          gh<_i16.CreateSavingUseCase>(),
          gh<_i21.ReadSavingListUseCase>(),
          gh<_i19.DeleteSavingListUseCase>(),
          gh<_i25.UpdateSavingListUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i30.RegisterModule {}
