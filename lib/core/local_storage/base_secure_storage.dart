import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

enum BaseSecureStorageKey { accessToken }

extension BaseSecureStorageString on BaseSecureStorageKey {
  String _key() {
    switch (this) {
      case BaseSecureStorageKey.accessToken:
        return 'ACCESS_TOKEN';
      default:
        assert(false);
    }
    return '';
  }
}

@Singleton()
class BaseSecureStorage {
  final FlutterSecureStorage _storage;

  BaseSecureStorage(this._storage);

  /// Encrypts and saves the [key] with the given [value].
  ///
  /// If the key was already in the storage, its associated value is changed.
  /// [value] and [key] shoudn't be null.
  /// Can throw a [PlatformException].
  ///

  Future<void> write({
    required BaseSecureStorageKey key,
    required String value,
  }) async =>
      _storage.write(
        key: key._key(),
        value: value,
      );

  /// Decrypts and returns the value for the given [key] or null if [key] is not in the storage.
  ///
  /// [key] shoudn't be null.
  /// [iOptions] optional iOS options
  /// [aOptions] optional Android options
  /// Can throw a [PlatformException].
  Future<String?> read({
    required BaseSecureStorageKey key,
  }) async =>
      _storage.read(
        key: key._key(),
      );

  /// Deletes associated value for the given [key].
  ///
  /// [key] shoudn't be null.
  /// [iOptions] optional iOS options
  /// [aOptions] optional Android options
  /// Can throw a [PlatformException].
  Future<void> delete({
    required BaseSecureStorageKey key,
  }) =>
      _storage.delete(
        key: key._key(),
      );
}
