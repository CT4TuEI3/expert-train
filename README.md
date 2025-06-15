# 📸 ExpertTrain

iOS-приложение, использующее кастомный `PhotosService` для взаимодействия с API [unsplash.com](https://unsplash.com/developers).

## 📚 Технический стек

- Swift + UIKit
- UICollectionView, UICollectionViewLayout
- Autolyaout (Programmatic)
- MVP + Builder
- API, URLSession

## ⚙️ Требования

- Xcode 16+
- Swift 5.9+
- iOS & iPadOS 17.0+
- `Configure.plist` с приватным API-ключом

## 📦 Установка

1. Клонируйте репозиторий:

```bash
git clone https://github.com/CT4TuEI3/expert-train.git
cd expert-train
```

2. Откройте проект в Xcode:

```bash
open ExpertTrain.xcodeproj
```

## 🔐 Настройка API ключа

Приложение требует файл `Configure.plist` для инициализации `PhotosService`. Этот файл должен содержать приватный API ключ.

### Шаги:

1. В папке `Core` создайте файл с именем `Configure.plist`.

2. Добавьте в него следующий контент:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>API_KEY</key>
        <string>ваш unsplash ACCESS_KEY</string>
    </dict>
</plist>
```

3. Добавьте `Configure.plist` в проект через Xcode.

4. Проверьте, что файл добавлен в **Build Phases > Copy Bundle Resources**, чтобы он оказался в бандле.

> ⚠️ Если файл отсутствует или не содержит ключ `API_KEY`, приложение завершится с ошибкой (`Configure.plist not found`).

## ▶️ Сборка и запуск

1. Убедитесь, что `Configure.plist` находится в проекте и корректно настроен.
2. Выберите нужное устройство или симулятор в Xcode.
3. Нажмите `Cmd + R` для сборки и запуска проекта.

## 📬 Поддержка

Если у вас есть вопросы, предложения или вы нашли баг — создайте issue или pull request.
