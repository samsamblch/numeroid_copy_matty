#!/bin/bash

# Инициализация переменных
REPO_NAME=""
PLATFORM="ios"

# Обработка аргументов с флагами
while getopts n: flag
do
    case "${flag}" in
        n) REPO_NAME=${OPTARG};;
    esac
done

# Проверка обязательных параметров
if [ -z "$REPO_NAME" ]; then
    echo "Usage: $0 -n REPO_NAME"
    exit 1
fi

# Извлечение версии и номера сборки из pubspec.yaml
VERSION_NAME=$(grep '^version: ' pubspec.yaml | cut -d ' ' -f 2)
# Заменяем + на -
VERSION_NAME=$(echo $VERSION_NAME | sed 's/+/-/')

# Сборка IPA
flutter build ipa --export-options-plist=sign/ios/exportOptionsBeta.plist

# Подготовка директории для артефакта
mkdir -p build/artifacts/$PLATFORM

# Переименование и перемещение IPA
mv build/ios/ipa/App.ipa build/artifacts/$PLATFORM/${REPO_NAME}-${PLATFORM}-${VERSION_NAME}-beta.ipa