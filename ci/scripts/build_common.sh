#!/bin/bash

# Инициализация переменных
BUILD_NUMBER=""
REPO_NAME=""

# Обработка аргументов с флагами
while getopts b:n: flag
do
    case "${flag}" in
        b) BUILD_NUMBER=${OPTARG};;
        n) REPO_NAME=${OPTARG};;
    esac
done

# Проверка, что обязательные параметры заданы
if [ -z "$BUILD_NUMBER" ] || [ -z "$REPO_NAME" ]; then
    echo "Usage: $0 -b BUILD_NUMBER -n REPO_NAME"
    exit 1
fi

# Настройка версии в pubspec.yaml
VERSION=$(grep '^version: ' pubspec.yaml | cut -d ' ' -f 2 | cut -d '+' -f 1)
sed -i.bak "s/^version: .*/version: $VERSION+$BUILD_NUMBER/" pubspec.yaml

# Сохранение версии в переменную окружения для последующего использования
echo "VERSION_NAME=$VERSION+$BUILD_NUMBER" >> $GITHUB_ENV
echo "REPO_NAME=$REPO_NAME" >> $GITHUB_ENV