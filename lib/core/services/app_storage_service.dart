import 'package:get_storage/get_storage.dart';

class AppStorageService {
  // Instance of GetStorage
  final GetStorage _storage = GetStorage();

  static const String languageKey = 'language';

  // Initialize storage (call this in main.dart before running the app)
  //! chnage transaction language
  Future<void> init() async {
    await GetStorage.init();
  }

  // Save the selected language index
  Future<void> saveLanguage(String languageCode) async {
    await _storage.write(languageKey, languageCode);
  }

  // Get the selected language index, returns 0 if not found
  String getLanguage() {
    return _storage.read<String>(languageKey) ?? "km";
  }
}
