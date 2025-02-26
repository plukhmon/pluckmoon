import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../ui/configs/data/models/config_model.dart';

class PreferencesController extends GetxController {
  static PreferencesController get to => Get.find<PreferencesController>();

  final _storage = GetStorage();

  // Reactive variable to store the config
  final _config = Rx<ConfigModel?>(null);

  ConfigModel? get config => _config.value;

  PreferencesController() {
    // Initialize storage
    _init();
  }

  Future<void> _init() async {
    final source = await _storage.read('config');
    if (source != null) {
      _config.value = ConfigModel.fromJson(source);
    }
    // Update the UI if needed
    update();
  }

  Future<bool> saveConfig(ConfigModel config) async {
    await _storage.write('config', config.toJson());
    _config.value = config;
    update();
    return true;
  }
}
