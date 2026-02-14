.PHONY: help up down restart logs ps stats

# Display help by default
.DEFAULT_GOAL := help

help:
	@echo "======================================"
	@echo "  API QJA - Docker commands"
	@echo "======================================"
	@echo ""
	@echo "DEVELOPMENT && PRODUCTION"
	@echo "  make up          	Start docker containers"
	@echo "  make down        	Stop docker containers"
	@echo "  make restart        Restart docker containers"
	@echo ""
	@echo "MONITORING"
	@echo "  make logs            Logs in real time"
	@echo "  make ps              Containers status"
	@echo "  make stats           Stats CPU/RAM"
	@echo ""
	@echo "======================================"

# ==========================================
# DEVELOPPEMENT && PRODUCTION
# ==========================================

up:
	docker compose up -d --build

down:
	docker compose down

restart:
	docker compose down
	docker compose up -d --build

# ==========================================
# MONITORING
# ==========================================

logs:
	docker compose logs -f

ps:
	docker ps

stats:
	docker stats
