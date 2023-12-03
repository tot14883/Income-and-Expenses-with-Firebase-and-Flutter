import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/core/local_storage/base_shared_preference.dart';

@injectable
class AddCashUseCase extends UseCase<double, void> {
  FirebaseStoreDatabase firebaseStoreDatabase;
  BaseSharedPreference baseSharedPreference;

  AddCashUseCase(
    this.firebaseStoreDatabase,
    this.baseSharedPreference,
  );

  @override
  Future<void> exec(double request) async {
    final token = baseSharedPreference.getString(BaseSharePreferenceKey.token);
    final collect = firebaseStoreDatabase.collection('users');

    final Map<String, dynamic> myData = {
      "income_expenses_money": request,
    };

    await collect.doc(token).set(
          myData,
          SetOptions(merge: true),
        );
  }
}
