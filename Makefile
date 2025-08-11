COMPOSE=docker compose
SERVICE=mongodb

-include .env
export

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

down-v:
	$(COMPOSE) down -v

logs:
	$(COMPOSE) logs -f $(SERVICE)

shell:
	docker exec -it $${MONGO_CONTAINER_NAME:-local-mongodb} mongosh -u $$MONGO_INITDB_ROOT_USERNAME -p $$MONGO_INITDB_ROOT_PASSWORD --authenticationDatabase admin

backup:
	./scripts/backup.sh

restore:
	./scripts/restore.sh

ps:
	$(COMPOSE) ps