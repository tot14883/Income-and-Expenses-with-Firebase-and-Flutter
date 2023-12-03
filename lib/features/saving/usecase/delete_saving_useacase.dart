import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/core/local_storage/base_shared_preference.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';
import 'package:smart_money/utils/util/base_utils.dart';

@injectable
class DeleteSavingListUseCase extends UseCase<String, void> {
  FirebaseStoreDatabase firebaseStoreDatabase;
  BaseSharedPreference baseSharedPreference;

  DeleteSavingListUseCase(
    this.firebaseStoreDatabase,
    this.baseSharedPreference,
  );

  @override
  Future<void> exec(String id) async {
    final token = baseSharedPreference.getString(BaseSharePreferenceKey.token);
    final collect = firebaseStoreDatabase.collection('users');

    final savingListCollect = await firebaseStoreDatabase
        .collection('users')
        .doc(token)
        .collection('saving_list')
        .where('id', isEqualTo: id)
        .get()
        .then((value) => value.docs);

    final savingMoneyCollect = await firebaseStoreDatabase
        .collection('users')
        .doc(token)
        .get()
        .then((value) => value.data() as Map<dynamic, dynamic>);

    final data = savingListCollect.map((e) => e.data()).toList()[0];

    final money = data['money'];
    final isIncome = TypeIncomeExpenses.values.byName(data['type']) ==
        TypeIncomeExpenses.income;
    final savingMoney = savingMoneyCollect['saving_money'];

    final Map<String, dynamic> myData = {
      "saving_money": isIncome
          ? BaseUtils.roundDouble(savingMoney - money, 2)
          : BaseUtils.roundDouble(savingMoney + money, 2),
    };

    await collect.doc(token).update(myData);

    await collect.doc(token).collection('saving_list').doc(id).delete();
  }
}
