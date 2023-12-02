import 'package:smart_money/utils/util/encode_utils.dart';

class UserAndPass {
  UserAndPass._();

  static String get token => 'admin@mail.com&123456'.generateMd5;
}
