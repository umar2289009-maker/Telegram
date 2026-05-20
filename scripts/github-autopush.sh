#!/bin/sh
# Автопуш новых коммитов на GitHub каждые 30 минут

REPO="https://github.com/umar2289009-maker/Telegram.git"

while true; do
    if [ -n "$GITHUB_PERSONAL_ACCESS_TOKEN" ]; then
        PUSH_URL="https://$GITHUB_PERSONAL_ACCESS_TOKEN@github.com/umar2289009-maker/Telegram.git"
        RESULT=$(git push "$PUSH_URL" main 2>&1)
        if echo "$RESULT" | grep -q "Everything up-to-date"; then
            echo "[autopush] Нет новых изменений"
        else
            echo "[autopush] Запушено на GitHub: $RESULT"
        fi
    else
        echo "[autopush] Ошибка: GITHUB_PERSONAL_ACCESS_TOKEN не задан"
    fi
    sleep 1800
done
