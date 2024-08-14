#!/bin/bash

# Инициализация переменных, задаваемых извне
ENV_VERSION=""  # Окружение (dev/prod)
NAME=""  # Название проекта

# Инициализация постоянных переменных
PLATFORM="android"  # Платформа (в данном случае Android)

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

# Очистка старых артефактов и кэша
echo "Cleaning old build artifacts and cache"
# Удаление предыдущих сборок, если они существуют
rm -rf build/app/outputs/flutter-apk/*

# Сборка APK с использованием Flutter
echo "Building APK"
# Сборка APK для заданного окружения (основная команда)
flutter build apk

# Альтернативная команда сборки с указанием flavor (если используется)
# flutter build apk --release --flavor $ENV_VERSION 

# Установка разрешений на выполнение для скрипта генерирования имени файла
chmod +x ci/scripts/gen_filename.sh

# Формирование имени APK файла с использованием генерированного имени
echo "Generating APK filename"
FILENAME=$(ci/scripts/gen_filename.sh -n $NAME -p $PLATFORM -e $ENV_VERSION)

# Создание директории для артефактов, если она не существует
echo "Creating directory for artifacts if it doesn't exist"
mkdir -p build/artifacts/$PLATFORM

# Переименование и перемещение APK файла
echo "Renaming and moving APK file"
mv build/app/outputs/flutter-apk/app-release.apk build/artifacts/$PLATFORM/${FILENAME}.apk

# Проверка на успешное перемещение
if [ $? -eq 0 ]; then
    echo "APK successfully built and moved to build/artifacts/$PLATFORM/${FILENAME}.apk"
else
    echo "Failed to move APK file"
    exit 1
fi