import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/features/authentication/user_and_pass.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';

@injectable
class ReadSummaryUseCase extends UseCase<void, MyAccountResponse> {
  FirebaseStoreDatabase firebaseStoreDatabase;

  ReadSummaryUseCase(this.firebaseStoreDatabase);

  @override
  Future<MyAccountResponse> exec(void request) async {
    final savingListCollect = await firebaseStoreDatabase
        .collection('users')
        .doc(UserAndPass.token)
        .collection('income_expenses_list')
        .orderBy('created_at')
        .get()
        .then((value) => value.docs);

    double incomeExpenseMoney = 0.0;
    List<MyAccountDetailResponse> incomeExpensesList = [];

    for (final item in savingListCollect.reversed) {
      final _data = item.data();
      incomeExpenseMoney += _data['money'];
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
      incomeExpenseMoney: incomeExpenseMoney,
      myAccountDetail: incomeExpensesList,
    );
  }
}
