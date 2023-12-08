import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/features/authentication/model/request/sign_up_request.dart';

@injectable
class CreateUserUsecase extends UseCase<SignUpRequest, bool> {
  FirebaseStoreDatabase firebaseStoreDatabase;

  CreateUserUsecase(
    this.firebaseStoreDatabase,
  );

  @override
  Future<bool> exec(SignUpRequest request) async {
    try {
      final isExist = await firebaseStoreDatabase
          .collection('authentication')
          .where(
            'email',
            isEqualTo: request.email,
          )
          .get()
          .then((value) => value.docs);

      if (isExist.isNotEmpty) {
        return false;
      } else {
        final collect = firebaseStoreDatabase.collection('authentication');

        final Map<String, dynamic> myData = {
          "email": request.email,
          "password": request.password,
        };

        await collect.add(myData);

        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
