#!/bin/bash

# Инициализация переменных
REPO_NAME=""
PLATFORM="android"

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

# Извлечение версии из pubspec.yaml
VERSION_NAME=$(grep '^version: ' pubspec.yaml | cut -d ' ' -f 2)

# Сборка APK
flutter build apk

# Подготовка директории для артефакта
mkdir -p build/artifacts/$PLATFORM

# Переименование и перемещение APK
mv build/app/outputs/flutter-apk/app-release.apk build/artifacts/$PLATFORM/${REPO_NAME}-${PLATFORM}-${VERSION_NAME}-beta.apk