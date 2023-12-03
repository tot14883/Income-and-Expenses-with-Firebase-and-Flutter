import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/core/local_storage/base_shared_preference.dart';
import 'package:smart_money/features/income_expenses/model/request/my_account_request.dart';

@injectable
class UpdateIncomeExpensesUseCase extends UseCase<MyAccountRequest, void> {
  FirebaseStoreDatabase firebaseStoreDatabase;
  BaseSharedPreference baseSharedPreference;

  UpdateIncomeExpensesUseCase(
    this.firebaseStoreDatabase,
    this.baseSharedPreference,
  );

  @override
  Future<void> exec(MyAccountRequest request) async {
    final token = baseSharedPreference.getString(BaseSharePreferenceKey.token);
    final collect = firebaseStoreDatabase.collection('users');
    final id = request.id;

    final Map<String, dynamic> myData = {
      "income_expenses_money": request.incomeExpensesMoney,
    };

    final savingList = {
      "id": id,
      "money": request.money,
      "detail": request.detail,
      "type": '${request.type?.name}',
      "dateTime": "${request.dateTime}",
    };

    await collect
        .doc(token)
        .collection('income_expenses_list')
        .doc(id)
        .update(savingList);

    await collect.doc(token).update(myData);
  }
}
