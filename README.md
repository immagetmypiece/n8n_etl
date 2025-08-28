Чтобы запустить окружение и настроить n8n с нуля:
```powershell
docker compose up -d
```

Чтобы восстановить окружение с потоком и данными:
```powershell
# 1) Создать пустые тома (имена должны совпадать с docker-compose)
docker volume create n8n_etl_n8n_data
docker volume create n8n_etl_pg_data

# 2) Развернуть архивы в тома
docker run --rm -v n8n_etl_n8n_data:/v -v ${PWD}/backup:/b alpine sh -c "cd /v && tar xzf /b/n8n_data.tgz"
docker run --rm -v n8n_etl_pg_data:/v  -v ${PWD}/backup:/b alpine sh -c "cd /v && tar xzf /b/pg_data.tgz && chown -R 999:999 /v"

# 3) Поднять окружение
docker compose up -d --force-recreate
```
Креды для входа в n8n - admin@admin.admin adminAdmin1, для pg - в .env

Реализация протестирована на примере Google Maps Scraper, запрос - coffee shops in Moscow

<img width="1154" height="275" alt="изображение" src="https://github.com/user-attachments/assets/2256cc22-6c1b-46c2-994d-0429f0216d04" />


<img width="1837" height="806" alt="изображение" src="https://github.com/user-attachments/assets/25cb3e0a-fce0-42c6-8895-5a2e0677cdb4" />


<img width="1718" height="447" alt="изображение" src="https://github.com/user-attachments/assets/2d4bbb4e-bd0c-4c1c-b4e8-f479e85c1aa4" />


<img width="1647" height="825" alt="изображение" src="https://github.com/user-attachments/assets/199d0036-68a4-44f8-81fc-e82fae93b0be" />
