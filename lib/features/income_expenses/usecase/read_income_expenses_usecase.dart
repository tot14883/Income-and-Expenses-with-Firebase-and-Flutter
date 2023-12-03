import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/core/local_storage/base_shared_preference.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';

@injectable
class ReadIncomeExpensesUseCase extends UseCase<String, MyAccountResponse> {
  FirebaseStoreDatabase firebaseStoreDatabase;
  BaseSharedPreference baseSharedPreference;

  ReadIncomeExpensesUseCase(
    this.firebaseStoreDatabase,
    this.baseSharedPreference,
  );

  @override
  Future<MyAccountResponse> exec(String request) async {
    try {
      final token =
          baseSharedPreference.getString(BaseSharePreferenceKey.token);
      final collect = await firebaseStoreDatabase
          .collection('users')
          .doc(token)
          .get()
          .then((value) => value.data() as Map<String, dynamic>);

      final incomeExpensesListCollect = await firebaseStoreDatabase
          .collection('users')
          .doc(token)
          .collection('income_expenses_list')
          .orderBy('created_at')
          .get()
          .then((value) => value.docs);

      final incomeExpensesMoney = collect['income_expenses_money'];
      List<MyAccountDetailResponse> incomeExpensesList = [];

      for (final item in incomeExpensesListCollect.reversed) {
        final _data = item.data();
        incomeExpensesList.add(
          MyAccountDetailResponse(
            id: _data['id'],
            detail: _data['detail'],
            money: _data['money'],
            dateTime: _data['dateTime'],
            type: TypeIncomeExpenses.values.byName(_data['type']),
          ),
        );
      }

      return MyAccountResponse(
        incomeExpenseMoney: incomeExpensesMoney,
        myAccountDetail: incomeExpensesList,
      );
    } catch (e) {
      return const MyAccountResponse();
    }
  }
}
