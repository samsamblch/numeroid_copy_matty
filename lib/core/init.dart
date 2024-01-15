import 'package:easy_localization/easy_localization.dart';
import 'locator.dart';

Future<void> init() async {
  // Настройка зависимостей
  setupLocator();

  // Подключаем механизм локализации
  await EasyLocalization.ensureInitialized();

  // await Hive.initFlutter();
  
}
