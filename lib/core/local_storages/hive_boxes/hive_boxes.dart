import 'package:ort_mobile/core/local_storages/utils/keys.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterBoxes {
  /// register
  Future<void> registerBoxes() async {
    /// Hive box for preferences
    await Hive.openBox<dynamic>(preferencesBox);

    /// Hive box for user
    // await Hive.openBox<RegisterCredentials>(userBox);
  }
}
