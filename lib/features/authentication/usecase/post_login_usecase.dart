import 'package:injectable/injectable.dart';
import 'package:smart_money/core/application/usecase.dart';
import 'package:smart_money/core/firebase/database/firebase_store_database.dart';
import 'package:smart_money/features/authentication/model/request/login_request.dart';

@injectable
class PostLoginUseCase extends UseCase<LoginRequest, bool> {
  FirebaseStoreDatabase firebaseStoreDatabase;

  PostLoginUseCase(
    this.firebaseStoreDatabase,
  );

  @override
  Future<bool> exec(LoginRequest request) async {
    try {
      final collect = await firebaseStoreDatabase
          .collection('authentication')
          .where(
            'email',
            isEqualTo: request.email,
          )
          .where(
            'password',
            isEqualTo: request.password,
          )
          .get()
          .then((value) => value.docs);

      return collect.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
