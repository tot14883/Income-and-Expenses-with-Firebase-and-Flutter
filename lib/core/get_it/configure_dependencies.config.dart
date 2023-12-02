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
import 'package:shared_preferences/shared_preferences.dart' as _i14;
import 'package:smart_money/core/cache/base_custom_cache_manager.dart' as _i3;
import 'package:smart_money/core/firebase/database/firebase_store_database.dart'
    as _i6;
import 'package:smart_money/core/get_it/register_module.dart' as _i27;
import 'package:smart_money/core/internet/internet_connection_observer.dart'
    as _i10;
import 'package:smart_money/core/local_storage/base_secure_storage.dart'
    as _i19;
import 'package:smart_money/core/local_storage/base_shared_preference.dart'
    as _i20;
import 'package:smart_money/core/route/go_router_provider.dart' as _i8;
import 'package:smart_money/features/example/bloc/example_bloc.dart' as _i5;
import 'package:smart_money/features/income_expenses/bloc/income_expenses_bloc.dart'
    as _i25;
import 'package:smart_money/features/income_expenses/usecase/add_cash_usecase.dart'
    as _i18;
import 'package:smart_money/features/income_expenses/usecase/create_income_expenses_usecase.dart'
    as _i21;
import 'package:smart_money/features/income_expenses/usecase/delete_income_expenses_useacase.dart'
    as _i23;
import 'package:smart_money/features/income_expenses/usecase/read_income_expenses_usecase.dart'
    as _i11;
import 'package:smart_money/features/income_expenses/usecase/update_income_expenses_usecase.dart'
    as _i16;
import 'package:smart_money/features/saving/bloc/saving_bloc.dart' as _i26;
import 'package:smart_money/features/saving/usecase/create_saving_usecase.dart'
    as _i22;
import 'package:smart_money/features/saving/usecase/delete_saving_useacase.dart'
    as _i24;
import 'package:smart_money/features/saving/usecase/read_saving_usecase.dart'
    as _i12;
import 'package:smart_money/features/saving/usecase/update_saving_usecase.dart'
    as _i17;
import 'package:smart_money/features/summarize/bloc/summary_bloc.dart' as _i15;
import 'package:smart_money/features/summarize/usecase/read_summary_usecase.dart'
    as _i13;

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
    gh.factory<_i11.ReadIncomeExpensesUseCase>(
        () => _i11.ReadIncomeExpensesUseCase(gh<_i6.FirebaseStoreDatabase>()));
    gh.factory<_i12.ReadSavingListUseCase>(
        () => _i12.ReadSavingListUseCase(gh<_i6.FirebaseStoreDatabase>()));
    gh.factory<_i13.ReadSummaryUseCase>(
        () => _i13.ReadSummaryUseCase(gh<_i6.FirebaseStoreDatabase>()));
    await gh.factoryAsync<_i14.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i15.SummaryBloc>(
        () => _i15.SummaryBloc(gh<_i13.ReadSummaryUseCase>()));
    gh.factory<_i16.UpdateIncomeExpensesUseCase>(() =>
        _i16.UpdateIncomeExpensesUseCase(gh<_i6.FirebaseStoreDatabase>()));
    gh.factory<_i17.UpdateSavingListUseCase>(
        () => _i17.UpdateSavingListUseCase(gh<_i6.FirebaseStoreDatabase>()));
    gh.factory<_i18.AddCashUseCase>(
        () => _i18.AddCashUseCase(gh<_i6.FirebaseStoreDatabase>()));
    gh.singleton<_i19.BaseSecureStorage>(
        _i19.BaseSecureStorage(gh<_i7.FlutterSecureStorage>()));
    gh.singleton<_i20.BaseSharedPreference>(
        _i20.BaseSharedPreference(gh<_i14.SharedPreferences>()));
    gh.factory<_i21.CreateIncomeExpensesUseCase>(() =>
        _i21.CreateIncomeExpensesUseCase(gh<_i6.FirebaseStoreDatabase>()));
    gh.factory<_i22.CreateSavingUseCase>(
        () => _i22.CreateSavingUseCase(gh<_i6.FirebaseStoreDatabase>()));
    gh.factory<_i23.DeleteIncomeExpensesUseCase>(() =>
        _i23.DeleteIncomeExpensesUseCase(gh<_i6.FirebaseStoreDatabase>()));
    gh.factory<_i24.DeleteSavingListUseCase>(
        () => _i24.DeleteSavingListUseCase(gh<_i6.FirebaseStoreDatabase>()));
    gh.factory<_i25.IncomeExpensesBloc>(() => _i25.IncomeExpensesBloc(
          gh<_i18.AddCashUseCase>(),
          gh<_i11.ReadIncomeExpensesUseCase>(),
          gh<_i23.DeleteIncomeExpensesUseCase>(),
          gh<_i16.UpdateIncomeExpensesUseCase>(),
          gh<_i21.CreateIncomeExpensesUseCase>(),
        ));
    gh.factory<_i26.SavingBloc>(() => _i26.SavingBloc(
          gh<_i22.CreateSavingUseCase>(),
          gh<_i12.ReadSavingListUseCase>(),
          gh<_i24.DeleteSavingListUseCase>(),
          gh<_i17.UpdateSavingListUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i27.RegisterModule {}
