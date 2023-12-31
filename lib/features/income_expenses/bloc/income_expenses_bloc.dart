import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_money/features/income_expenses/bloc/state/income_expenses_state.dart';
import 'package:smart_money/features/income_expenses/enum/field_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/model/request/my_account_request.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';
import 'package:smart_money/features/income_expenses/usecase/add_cash_usecase.dart';
import 'package:smart_money/features/income_expenses/usecase/create_income_expenses_usecase.dart';
import 'package:smart_money/features/income_expenses/usecase/delete_income_expenses_useacase.dart';
import 'package:smart_money/features/income_expenses/usecase/read_income_expenses_usecase.dart';
import 'package:smart_money/features/income_expenses/usecase/update_income_expenses_usecase.dart';
import 'package:smart_money/utils/util/base_utils.dart';
import 'package:smart_money/utils/util/date_format.dart';
import 'package:smart_money/widgets/activity_indicator.dart';
import 'package:smart_money/widgets/base_form.dart';

@injectable
class IncomeExpensesBloc extends Cubit<IncomeExpensesState> {
  final AddCashUseCase _addCashUseCase;
  final ReadIncomeExpensesUseCase _readIncomeExpensesUseCase;
  final DeleteIncomeExpensesUseCase _deleteIncomeExpensesUseCase;
  final UpdateIncomeExpensesUseCase _updateIncomeExpensesUseCase;
  final CreateIncomeExpensesUseCase _createIncomeExpensesUseCase;

  IncomeExpensesBloc(
    this._addCashUseCase,
    this._readIncomeExpensesUseCase,
    this._deleteIncomeExpensesUseCase,
    this._updateIncomeExpensesUseCase,
    this._createIncomeExpensesUseCase,
  ) : super(const IncomeExpensesState());

  final _activityIndicator = ActivityIndicator();
  final _baseFormData = BaseFormData();

  ValueStream<bool> get isLoading => _activityIndicator;

  void onChanged(BaseFormData baseFormData) {
    final newData = _baseFormData.copyAndMerge(baseFormData);
    emit(state.copyWith(baseFormData: newData));
  }

  Future<bool> addCashMoney(bool isIncome, double? incomeExpensesMoney) async {
    final cash = state.baseFormData?.getValue<String>(FieldIncomeExpenses.cash);

    double _cash = BaseUtils.roundDouble(double.parse(cash ?? '0.0'), 2);
    if (incomeExpensesMoney != null) {
      _cash = incomeExpensesMoney + _cash;
    }

    await _addCashUseCase.execute(
      _cash,
    );
    await readIncomeExpensesList(isIncome);

    return true;
  }

  Future<void> readIncomeExpensesList([
    bool isIncome = true,
  ]) async {
    final nowaday = DateTime.now();

    final _dateTime = BaseDateFormatter.formatDateTimeWithNameOfMonth(
      nowaday,
      'yyyy-MM-dd',
    );
    final result = await _readIncomeExpensesUseCase.execute(_dateTime);
    result.when(
      (success) {
        final data = success.myAccountDetail;
        List<MyAccountDetailResponse> myAccount = [];
        if (data != null) {
          if (isIncome) {
            myAccount = data
                .where((element) => element.type == TypeIncomeExpenses.income)
                .toList();
          } else {
            myAccount = data
                .where((element) => element.type == TypeIncomeExpenses.expenses)
                .toList();
          }
        }

        final response = MyAccountResponse(
          incomeExpenseMoney: success.incomeExpenseMoney,
          myAccountDetail: myAccount,
        );

        emit(
          state.copyWith(
            myAccount: response,
          ),
        );
      },
      (error) => null,
    );
  }

  void deleteIncomeExpenses(String id, bool isIncome) async {
    await _deleteIncomeExpensesUseCase.execute(id);
    await readIncomeExpensesList(isIncome);
  }

  void createIncomeExpenses(bool isIncome) async {
    final dateTime =
        state.baseFormData?.getValue<String>(FieldIncomeExpenses.dateTime);
    final money =
        state.baseFormData?.getValue<String>(FieldIncomeExpenses.cash);
    final detail =
        state.baseFormData?.getValue<String>(FieldIncomeExpenses.detail);

    final moneyTotal = isIncome
        ? (state.myAccount?.incomeExpenseMoney ?? 0) +
            double.parse(money ?? '0.0')
        : (state.myAccount?.incomeExpenseMoney ?? 0) -
            double.parse(money ?? '0.0');

    final request = MyAccountRequest(
      money: BaseUtils.roundDouble(double.parse(money ?? '0.0'), 2),
      detail: detail,
      dateTime: dateTime,
      incomeExpensesMoney: BaseUtils.roundDouble(moneyTotal, 2),
      type: isIncome ? TypeIncomeExpenses.income : TypeIncomeExpenses.expenses,
    );

    await _createIncomeExpensesUseCase.execute(request);
    await readIncomeExpensesList(isIncome);
  }

  Future<bool> editIncomeExpenses(
    String id,
    bool isIncome,
    String exMoney,
    TypeIncomeExpenses type,
  ) async {
    final dateTime =
        state.baseFormData?.getValue<String>(FieldIncomeExpenses.dateTime);
    final money =
        state.baseFormData?.getValue<String>(FieldIncomeExpenses.cash);
    final detail =
        state.baseFormData?.getValue<String>(FieldIncomeExpenses.detail);
    final moneyUndo = type == TypeIncomeExpenses.expenses
        ? (state.myAccount?.incomeExpenseMoney ?? 0) + double.parse(exMoney)
        : (state.myAccount?.incomeExpenseMoney ?? 0) - double.parse(exMoney);

    final moneyTotal = isIncome
        ? moneyUndo + double.parse(money ?? '0.0')
        : moneyUndo - double.parse(money ?? '0.0');

    final request = MyAccountRequest(
      id: id,
      money: BaseUtils.roundDouble(double.parse(money ?? '0.0'), 2),
      detail: detail,
      dateTime: dateTime,
      incomeExpensesMoney: BaseUtils.roundDouble(moneyTotal, 2),
      type: isIncome ? TypeIncomeExpenses.income : TypeIncomeExpenses.expenses,
    );

    await _updateIncomeExpensesUseCase.execute(request);

    return true;
  }
}
