import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/core/local_storage/base_shared_preference.dart';
import 'package:smart_money/features/income_expenses/model/request/my_account_request.dart';

@injectable
class CreateSavingUseCase extends UseCase<MyAccountRequest, void> {
  FirebaseStoreDatabase firebaseStoreDatabase;
  BaseSharedPreference baseSharedPreference;

  CreateSavingUseCase(
    this.firebaseStoreDatabase,
    this.baseSharedPreference,
  );

  @override
  Future<void> exec(MyAccountRequest request) async {
    final token = baseSharedPreference.getString(BaseSharePreferenceKey.token);
    final collect = firebaseStoreDatabase.collection('users');
    final id = collect.doc().id;

    final Map<String, dynamic> myData = {
      "saving_money": request.savingMoney,
    };

    final savingList = {
      "id": id,
      "money": request.money,
      "detail": request.detail,
      "dateTime": "${request.dateTime}",
      "type": '${request.type?.name}',
      "created_at": FieldValue.serverTimestamp(),
    };

    await collect.doc(token).collection('saving_list').doc(id).set(
          savingList,
          SetOptions(merge: true),
        );

    await collect.doc(token).set(
          myData,
          SetOptions(merge: true),
        );
  }
}
