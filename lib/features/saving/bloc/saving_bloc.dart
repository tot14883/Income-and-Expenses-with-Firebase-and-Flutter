import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/model/request/my_account_request.dart';
import 'package:smart_money/features/saving/bloc/state/saving_state.dart';
import 'package:smart_money/features/saving/enum/field_saving_enum.dart';
import 'package:smart_money/features/saving/usecase/create_saving_usecase.dart';
import 'package:smart_money/features/saving/usecase/delete_saving_useacase.dart';
import 'package:smart_money/features/saving/usecase/read_saving_usecase.dart';
import 'package:smart_money/features/saving/usecase/update_saving_usecase.dart';
import 'package:smart_money/utils/util/base_utils.dart';
import 'package:smart_money/utils/util/date_format.dart';
import 'package:smart_money/widgets/activity_indicator.dart';
import 'package:smart_money/widgets/base_form.dart';

@injectable
class SavingBloc extends Cubit<SavingState> {
  final CreateSavingUseCase _createSavingUseCase;
  final ReadSavingListUseCase _readSavingListUseCase;
  final DeleteSavingListUseCase _deleteSavingListUseCase;
  final UpdateSavingListUseCase _updateSavingListUseCase;

  SavingBloc(
    this._createSavingUseCase,
    this._readSavingListUseCase,
    this._deleteSavingListUseCase,
    this._updateSavingListUseCase,
  ) : super(const SavingState());

  final _activityIndicator = ActivityIndicator();
  final _baseFormData = BaseFormData();

  ValueStream<bool> get isLoading => _activityIndicator;

  void onChanged(BaseFormData baseFormData) {
    final newData = _baseFormData.copyAndMerge(baseFormData);
    emit(state.copyWith(baseFormData: newData));
  }

  void createSaving(bool isIncrease) async {
    final dateTime =
        state.baseFormData?.getValue<String>(FieldSaving.savingDateTime);
    final money = state.baseFormData?.getValue<String>(FieldSaving.saving);
    final detail = state.baseFormData?.getValue<String>(FieldSaving.detail);

    final moneyTotal = isIncrease
        ? (state.myAccount?.savingMoney ?? 0) + double.parse(money ?? '0.0')
        : (state.myAccount?.savingMoney ?? 0) - double.parse(money ?? '0.0');

    final request = MyAccountRequest(
      money: BaseUtils.roundDouble(double.parse(money ?? '0.0'), 2),
      detail: detail,
      dateTime: dateTime,
      savingMoney: BaseUtils.roundDouble(moneyTotal, 2),
      type:
          isIncrease ? TypeIncomeExpenses.income : TypeIncomeExpenses.expenses,
    );

    await _createSavingUseCase.execute(request);
    await readSavingList();
  }

  Future<void> readSavingList([String? dateTime]) async {
    final nowaday = DateTime.now();

    final _dateTime = dateTime ??
        BaseDateFormatter.formatDateTimeWithNameOfMonth(
          nowaday,
          'yyyy-MM-dd',
        );
    final result = await _readSavingListUseCase.execute(_dateTime);
    result.when(
      (success) => emit(
        state.copyWith(
          myAccount: success,
        ),
      ),
      (error) => null,
    );
  }

  void deleteSaving(String id) async {
    await _deleteSavingListUseCase.execute(id);
    await readSavingList();
  }

  Future<bool> editSaving(
    String id,
    bool isIncrease,
    String exMoney,
    TypeIncomeExpenses type,
  ) async {
    final dateTime =
        state.baseFormData?.getValue<String>(FieldSaving.savingDateTime);
    final money = state.baseFormData?.getValue<String>(FieldSaving.saving);
    final detail = state.baseFormData?.getValue<String>(FieldSaving.detail);
    final moneyUndo = type == TypeIncomeExpenses.expenses
        ? (state.myAccount?.savingMoney ?? 0) + double.parse(exMoney)
        : (state.myAccount?.savingMoney ?? 0) - double.parse(exMoney);

    final moneyTotal = isIncrease
        ? moneyUndo + double.parse(money ?? '0.0')
        : moneyUndo - double.parse(money ?? '0.0');

    final request = MyAccountRequest(
      id: id,
      money: BaseUtils.roundDouble(double.parse(money ?? '0.0'), 2),
      detail: detail,
      dateTime: dateTime,
      savingMoney: BaseUtils.roundDouble(moneyTotal, 2),
      type:
          isIncrease ? TypeIncomeExpenses.income : TypeIncomeExpenses.expenses,
    );

    await _updateSavingListUseCase.execute(request);
    return true;
  }
}
