# Configuración del comando de compose
# Usa docker-compose por defecto, pero se puede cambiar con COMPOSE_CMD=podman-compose
COMPOSE_CMD ?= docker-compose

# Configuración del archivo de compose
# Usa deploy-compose.yml por defecto, pero se puede cambiar con COMPOSE_FILE=otro-archivo.yml
COMPOSE_FILE ?= deploy-compose.yml

start:
	$(COMPOSE_CMD) -f $(COMPOSE_FILE) up -d

stop:
	$(COMPOSE_CMD) -f $(COMPOSE_FILE) down

restart: stop start

logs:
	$(COMPOSE_CMD) -f $(COMPOSE_FILE) logs -f

status:
	$(COMPOSE_CMD) -f $(COMPOSE_FILE) ps

# Targets de ayuda
help:
	@echo "Comandos disponibles:"
	@echo "  start    - Iniciar los servicios"
	@echo "  stop     - Detener los servicios"
	@echo "  restart  - Reiniciar los servicios"
	@echo "  logs     - Mostrar logs en tiempo real"
	@echo "  status   - Mostrar estado de los servicios"
	@echo ""
	@echo "Configuración:"
	@echo "  COMPOSE_CMD  - Comando de compose (default: docker-compose)"
	@echo "  COMPOSE_FILE - Archivo de compose (default: deploy-compose.yml)"
	@echo ""
	@echo "Ejemplos:"
	@echo "  make start COMPOSE_CMD=podman-compose"
	@echo "  make start COMPOSE_FILE=docker-compose.yml"
	@echo "  make start COMPOSE_CMD=podman-compose COMPOSE_FILE=production.yml"
	@echo "  export COMPOSE_CMD=podman-compose && export COMPOSE_FILE=dev.yml && make start"

.PHONY: start stop restart logs status help