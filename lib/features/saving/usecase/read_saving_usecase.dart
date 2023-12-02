import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/features/authentication/user_and_pass.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';

@injectable
class ReadSavingListUseCase extends UseCase<String, MyAccountResponse> {
  FirebaseStoreDatabase firebaseStoreDatabase;

  ReadSavingListUseCase(this.firebaseStoreDatabase);

  @override
  Future<MyAccountResponse> exec(String request) async {
    final collect = await firebaseStoreDatabase
        .collection('users')
        .doc(UserAndPass.token)
        .get()
        .then((value) => value.data() as Map<String, dynamic>);

    final savingListCollect = await firebaseStoreDatabase
        .collection('users')
        .doc(UserAndPass.token)
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
