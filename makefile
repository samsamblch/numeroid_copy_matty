gen: #--always
	dart run build_runner build --delete-conflicting-outputs

gen\:locale:
	dart run easy_localization:generate -S assets/lang -o locale_loader.g.dart
	dart run easy_localization:generate -f keys -S assets/lang -o locale_keys.g.dart

# flutter build ipa --export-options-plist=sign/ios/exportOptionsBeta.plist