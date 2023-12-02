import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/features/authentication/user_and_pass.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';
import 'package:smart_money/utils/util/base_utils.dart';
// import 'package:smart_money/features/authentication/user_and_pass.dart';

@injectable
class DeleteIncomeExpensesUseCase extends UseCase<String, void> {
  FirebaseStoreDatabase firebaseStoreDatabase;

  DeleteIncomeExpensesUseCase(this.firebaseStoreDatabase);

  @override
  Future<void> exec(String id) async {
    try {
      final collect = firebaseStoreDatabase.collection('users');

      final incomeExpensesListCollect = await firebaseStoreDatabase
          .collection('users')
          .doc(UserAndPass.token)
          .collection('income_expenses_list')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs);

      final incomeExpensesCollect = await firebaseStoreDatabase
          .collection('users')
          .doc(UserAndPass.token)
          .get()
          .then((value) => value.data() as Map<dynamic, dynamic>);

      final data = incomeExpensesListCollect.map((e) => e.data()).toList()[0];

      final money = data['money'];
      final isIncome = TypeIncomeExpenses.values.byName(data['type']) ==
          TypeIncomeExpenses.income;
      final incomeExpensesMoney =
          incomeExpensesCollect['income_expenses_money'];

      final Map<String, dynamic> myData = {
        "income_expenses_money": !isIncome
            ? BaseUtils.roundDouble(incomeExpensesMoney + money, 2)
            : BaseUtils.roundDouble(incomeExpensesMoney - money, 2),
      };

      await collect.doc(UserAndPass.token).update(myData);

      await collect
          .doc(UserAndPass.token)
          .collection('income_expenses_list')
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }
}
