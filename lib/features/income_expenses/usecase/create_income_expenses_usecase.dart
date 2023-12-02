import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/features/authentication/user_and_pass.dart';
import 'package:smart_money/features/income_expenses/model/request/my_account_request.dart';
// import 'package:smart_money/features/authentication/user_and_pass.dart';

@injectable
class CreateIncomeExpensesUseCase extends UseCase<MyAccountRequest, void> {
  FirebaseStoreDatabase firebaseStoreDatabase;

  CreateIncomeExpensesUseCase(this.firebaseStoreDatabase);

  @override
  Future<void> exec(MyAccountRequest request) async {
    final collect = firebaseStoreDatabase.collection('users');
    final id = collect.doc().id;

    final Map<String, dynamic> myData = {
      "income_expenses_money": request.incomeExpensesMoney,
    };

    final savingList = {
      "id": id,
      "money": request.money,
      "detail": request.detail,
      "dateTime": "${request.dateTime}",
      "type": '${request.type?.name}',
      "created_at": FieldValue.serverTimestamp(),
    };

    await collect
        .doc(UserAndPass.token)
        .collection('income_expenses_list')
        .doc(id)
        .set(
          savingList,
          SetOptions(merge: true),
        );

    await collect.doc(UserAndPass.token).set(
          myData,
          SetOptions(merge: true),
        );
  }
}
