#!/bin/bash

# Инициализация переменных, задаваемых извне
ENV_VERSION=""  # Окружение (dev/prod)
NAME=""  # Название проекта

# Инициализация постоянных переменных
PLATFORM="ios"  # Платформа (в данном случае iOS)
MY_KEYCHAIN="temp_keychain"  # Название временного keychain
MY_KEYCHAIN_PASSWORD="temp_password"  # Пароль для временного keychain
CERT="sign/ios/cert_dist_12345678.p12"  # Путь к сертификату
CERT_PASSWORD="12345678"  # Пароль к сертификату (если есть)
MOBILEPROVISION="sign/ios/GJL3XCUNGUcomexamplenumeroid.mobileprovision"  # Путь к профилю подписания
EXPORT_OPTIONS_PLIST="sign/ios/exportOptionsBeta.plist"  # Путь к файлу exportOptionsPlist
FLAVOR=ENV_VERSION  # Использование переменной ENV_VERSION для указания FLAVOR

# Обработка аргументов с флагами
while getopts n:e: flag
do
    case "${flag}" in
        n) NAME=${OPTARG};;  # Название проекта (используется для формирования имени файла)
        e) ENV_VERSION=${OPTARG};;  # Окружение (dev/prod)
    esac
done

# Проверка обязательных параметров
if [ -z "$NAME" ] || [ -z "$ENV_VERSION" ]; then
    echo "Usage: $0 -n NAME -e ENV_VERSION"
    exit 1
fi

# Подготовка keychain и профилей подписания
echo "Prepare Sign Keychain and Profiles"
# Создание папки для профилей подписания, если она не существует
mkdir -p "$HOME/Library/MobileDevice/Provisioning Profiles/" 
# Копирование профиля подписания в нужную директорию
cp $MOBILEPROVISION "$HOME/Library/MobileDevice/Provisioning Profiles/"  

## Извлечение UUID из профиля подписания 
# Получение UUID профиля подписания
MOBILEPROVISION_UUID=$(grep -a -A 1 'UUID' $MOBILEPROVISION | tail -1 | sed 's/<[^>]*>//g' | awk '{$1=$1};1')

## Удаление и создание временного keychain
# Удаление временного keychain (если он существует)
security delete-keychain "$MY_KEYCHAIN" || true  
# Создание нового временного keychain
security create-keychain -p "$MY_KEYCHAIN_PASSWORD" "$MY_KEYCHAIN"  
# Добавление временного keychain в список используемых keychains
security list-keychains -d user -s "$MY_KEYCHAIN" $(security list-keychains -d user | sed s/\"//g)
# Установка параметров keychain (убирается тайм-аут блокировки)
security set-keychain-settings "$MY_KEYCHAIN"
# Разблокировка keychain с паролем
security unlock-keychain -p "$MY_KEYCHAIN_PASSWORD" "$MY_KEYCHAIN"  

## Импорт сертификата и настройка keychain для кодирования
# Импорт сертификата в keychain для использования в кодировании
security import $CERT -k "$MY_KEYCHAIN" -P "$CERT_PASSWORD" -T "/usr/bin/codesign" 
# Извлечение идентификатора сертификата
CERT_IDENTITY=$(security find-identity -v -p codesigning "$MY_KEYCHAIN" | head -1 | grep '"' | sed -e 's/[^"]*"//' -e 's/".*//')
# Разрешение использования ключа для кодирования
security set-key-partition-list -S apple-tool:,apple: -s -k $MY_KEYCHAIN_PASSWORD -D "$CERT_IDENTITY" -t private $MY_KEYCHAIN  

## Очистка старых артефактов и кэша
# Удаление кэша Xcode
# rm -rf ~/Library/Developer/Xcode/DerivedData 
# Удаление предыдущих сборок
# rm -rf ios/build/  
# Удаление файла Podfile.lock для обеспечения обновления зависимостей
# rm ios/Podfile.lock 
# Обновление локальных репозиториев CocoaPods
# pod repo update

# Сборка IPA с использованием Flutter и Xcode

# Сборка iOS проекта с Flutter без подписания
# flutter build ios --release --no-codesign --build-number $CI_PIPELINE_IID \
    # --flavor $FLAVOR --dart-define=app.flavor=$FLAVOR  
# Архивирование проекта с использованием Xcode и подписанием
# xcodebuild -workspace ios/Runner.xcworkspace -scheme $FLAVOR -sdk iphoneos \
   # -configuration "Release-$FLAVOR" archive -archivePath ios/build/Runner.xcarchive \
    # CODE_SIGN_IDENTITY="${CERT_IDENTITY}" OTHER_CODE_SIGN_FLAGS="--keychain ${MY_KEYCHAIN}" \
    # PROVISIONING_PROFILE="${MOBILEPROVISION_UUID}"
# Экспорт IPA с использованием Xcode 
# xcodebuild -exportArchive -archivePath ios/build/Runner.xcarchive -exportOptionsPlist \
    # "$EXPORT_OPTIONS_PLIST" -exportPath ios/build/Runner.ipa

# Cборка iOS проекта базовая
flutter build ipa --export-options-plist="$EXPORT_OPTIONS_PLIST"

## Очистка keychain после сборки
# Удаление временного keychain после завершения сборки
security delete-keychain "$MY_KEYCHAIN"

# Генерация имени файла для IPA
FILENAME=$(ci/scripts/gen_filename.sh -n $NAME -p $PLATFORM -e $ENV_VERSION)
# Копирование сгенерированного IPA в директорию артефактов

# Создание директории для артефактов, если она не существует
echo "Creating directory for artifacts if it doesn't exist"
mkdir -p build/artifacts/$PLATFORM

# Переименование и перемещение IPA файла
echo "Renaming and moving IPA file"
mv build/ios/ipa/$NAME.ipa build/artifacts/$PLATFORM/${FILENAME}.ipa  

# Проверка на успешное перемещение
if [ $? -eq 0 ]; then
    echo "IPA successfully built and moved to build/artifacts/$PLATFORM/${FILENAME}.ipa"
else
    echo "Failed to move ipa file"
    exit 1
fi