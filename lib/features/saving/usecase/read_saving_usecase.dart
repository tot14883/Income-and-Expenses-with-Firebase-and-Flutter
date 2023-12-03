import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/core/local_storage/base_shared_preference.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';

@injectable
class ReadSavingListUseCase extends UseCase<String, MyAccountResponse> {
  FirebaseStoreDatabase firebaseStoreDatabase;
  BaseSharedPreference baseSharedPreference;

  ReadSavingListUseCase(
    this.firebaseStoreDatabase,
    this.baseSharedPreference,
  );

  @override
  Future<MyAccountResponse> exec(String request) async {
    final token = baseSharedPreference.getString(BaseSharePreferenceKey.token);
    final collect = await firebaseStoreDatabase
        .collection('users')
        .doc(token)
        .get()
        .then((value) => value.data() as Map<String, dynamic>);

    final savingListCollect = await firebaseStoreDatabase
        .collection('users')
        .doc(token)
        .collection('saving_list')
        .orderBy('created_at')
        .get()
        .then((value) => value.docs);

    final savingMoney = collect['saving_money'];
    List<MyAccountDetailResponse> savingList = [];

    for (final item in savingListCollect.reversed) {
      final _data = item.data();
      savingList.add(
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
      savingMoney: savingMoney,
      myAccountDetail: savingList,
    );
  }
}
