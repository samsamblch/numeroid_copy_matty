#!/bin/bash

# Инициализация переменных
NAME=""
PLATFORM="ios"
ENV_VERSION=""

# Обработка аргументов с флагами
while getopts n:e: flag
do
    case "${flag}" in
        n) NAME=${OPTARG};;
        e) ENV_VERSION=${OPTARG};;
    esac
done

# Проверка обязательных параметров
if [ -z "$NAME" ] || [ -z "$ENV_VERSION" ]; then
    echo "Usage: $0 -n NAME -e ENV_VERSION"
    exit 1
fi

# Установка сертификатов и профилей подписания
echo "Installing certificates and provisioning profiles..."
security import sign/ios/cert_dist_12345678.p12 -P "" -T /usr/bin/codesign
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp sign/ios/GJL3XCUNGUcomexamplenumeroid.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/

# Формирование имени файла с использованием gen_filename.sh
FILENAME=$(ci/scripts/gen_filename.sh -n $NAME -p $PLATFORM -e $ENV_VERSION)

# Сборка IPA
flutter build ipa --export-options-plist=sign/ios/exportOptionsBeta.plist

# Подготовка директории для артефакта
mkdir -p build/artifacts/$PLATFORM

# Переименование и перемещение IPA
mv build/ios/ipa/App.ipa build/artifacts/$PLATFORM/${FILENAME}.ipa