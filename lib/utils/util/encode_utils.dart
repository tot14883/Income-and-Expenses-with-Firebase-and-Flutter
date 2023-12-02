import 'dart:convert';

import 'package:crypto/crypto.dart';

extension EncodeExtenstion on String {
  String get generateMd5 => md5.convert(utf8.encode(this)).toString();
}
