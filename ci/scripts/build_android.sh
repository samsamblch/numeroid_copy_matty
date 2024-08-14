#!/bin/bash

# Инициализация переменных
REPO_NAME=""
VERSION_NAME=""
PLATFORM="android"

# Обработка аргументов с флагами
while getopts n:v: flag
do
    case "${flag}" in
        n) REPO_NAME=${OPTARG};;
        v) VERSION_NAME=${OPTARG};;
    esac
done

# Проверка обязательных параметров
if [ -z "$REPO_NAME" ] || [ -z "$VERSION_NAME" ]; then
    echo "Usage: $0 -n REPO_NAME -v VERSION_NAME"
    exit 1
fi

# Сборка APK
flutter build apk

# Подготовка директории для артефакта
mkdir -p build/artifacts/$PLATFORM

# Переименование и перемещение APK
mv build/app/outputs/flutter-apk/app-release.apk build/artifacts/$PLATFORM/${REPO_NAME}-${PLATFORM}-${VERSION_NAME}-beta.apk