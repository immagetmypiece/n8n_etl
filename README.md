Чтобы запустить окружение и настроить n8n с нуля:
docker compose up -d

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

Креды для входа в n8n - admin@admin.admin adminAdmin1, для pg - в .env