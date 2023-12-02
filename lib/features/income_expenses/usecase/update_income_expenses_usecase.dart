import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/features/authentication/user_and_pass.dart';
import 'package:smart_money/features/income_expenses/model/request/my_account_request.dart';
// import 'package:smart_money/features/authentication/user_and_pass.dart';

@injectable
class UpdateIncomeExpensesUseCase extends UseCase<MyAccountRequest, void> {
  FirebaseStoreDatabase firebaseStoreDatabase;

  UpdateIncomeExpensesUseCase(this.firebaseStoreDatabase);

  @override
  Future<void> exec(MyAccountRequest request) async {
    try {
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
          .doc(UserAndPass.token)
          .collection('income_expenses_list')
          .doc(id)
          .update(savingList);

      await collect.doc(UserAndPass.token).update(myData);
    } catch (e) {
      print(e);
    }
  }
}
