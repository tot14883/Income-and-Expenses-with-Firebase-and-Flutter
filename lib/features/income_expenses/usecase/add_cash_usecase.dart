import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/features/authentication/user_and_pass.dart';
// import 'package:smart_money/features/authentication/user_and_pass.dart';

@injectable
class AddCashUseCase extends UseCase<double, void> {
  FirebaseStoreDatabase firebaseStoreDatabase;

  AddCashUseCase(this.firebaseStoreDatabase);

  @override
  Future<void> exec(double request) async {
    final collect = firebaseStoreDatabase.collection('users');

    final Map<String, dynamic> myData = {
      "income_expenses_money": request,
    };

    await collect.doc(UserAndPass.token).set(
          myData,
          SetOptions(merge: true),
        );
  }
}
