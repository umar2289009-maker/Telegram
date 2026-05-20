# Telegram Group Game Bot 🤖

Русскоязычный игровой бот для Telegram-групп. Рулетка, блэкджек, дуэли, гранаты, слоты, грабёж, ежедневные бонусы, ачивки, магазин с титулами, валюта «мэлкоины».

## Быстрый старт для нового агента

Если ты новый агент и работаешь с этим проектом:

1. **Основной файл бота** — `artifacts/api-server/bot.py`
2. **Бот запускается** через workflow `Telegram Bot` командой: `python3 artifacts/api-server/bot.py`
3. **Автопуш на GitHub** работает через workflow `GitHub Autopush` каждые 30 минут
4. **Чтобы запушить вручную:**
   ```bash
   git push "https://$GITHUB_PERSONAL_ACCESS_TOKEN@github.com/umar2289009-maker/Telegram.git" main
   ```
5. **Данные игроков** автоматически бэкапятся в `players_backup.json` и на GitHub каждые 10 минут

## Переменные окружения (Replit Secrets)

| Переменная | Описание |
|---|---|
| `TELEGRAM_BOT_TOKEN` | Токен бота от @BotFather |
| `DATABASE_URL` | PostgreSQL строка подключения (Replit DB) |
| `GITHUB_PERSONAL_ACCESS_TOKEN` | GitHub PAT для автопуша и бэкапа игроков |

## Структура проекта

```
artifacts/api-server/bot.py   — весь код бота (3500+ строк)
players_backup.json           — локальный бэкап данных игроков
requirements.txt              — Python зависимости
railway.toml                  — конфиг для Railway деплоя
scripts/github-autopush.sh    — скрипт автопуша на GitHub
```

## GitHub репозиторий

**https://github.com/umar2289009-maker/Telegram**

Код пушится автоматически каждые 30 минут через workflow `GitHub Autopush`.
Данные игроков (`players_backup.json`) пушатся на GitHub каждые 10 минут через встроенный механизм бота.

## Запуск и деплой

```bash
# Запуск в режиме разработки (через Replit workflow)
python3 artifacts/api-server/bot.py

# Установка зависимостей
pip install -r requirements.txt
```

Для Railway деплоя: подключи репозиторий `umar2289009-maker/Telegram`, добавь переменные `TELEGRAM_BOT_TOKEN` и `DATABASE_URL`.

## Команды бота

| Команда | Описание |
|---|---|
| `/рулетка [ставка]` | Русская рулетка |
| `/блэкджек [ставка]` | Блэкджек |
| `/дуэль @user [ставка]` | Дуэль с игроком |
| `/граната @user` | Бросить гранату |
| `/слоты [ставка]` | Игровые автоматы |
| `/ограбить @user` | Ограбление |
| `/профиль` | Профиль игрока |
| `/топ` | Таблица лидеров |
| `/магазин` | Магазин титулов |
| `/бонус` | Ежедневный бонус |
| `/ачивки` | Достижения |
| `/экспорт` | (Kolik only) Экспорт данных |
| `/импорт` | (Kolik only) Импорт данных |

## Администратор

Пользователь с именем `kolik` (без учёта регистра) — администратор бота.

## Система бэкапа

1. **Локальный файл** `players_backup.json` — обновляется каждые 5 минут
2. **GitHub бэкап** — `players_backup.json` загружается на GitHub каждые 10 минут
3. **При старте**: бот загружает данные из БД → если пусто, берёт локальный файл → если нет файла, скачивает с GitHub
4. **Восстановление**: при сбросе БД все данные восстановятся автоматически

## Стек

- Python 3, pyTelegramBotAPI, psycopg2
- PostgreSQL (Replit или Railway)
- GitHub для хранения кода и бэкапа данных
