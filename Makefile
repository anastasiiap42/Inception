name = project

PORTAINER_IMAGE = portainer/portainer-ce:2.11.1
PORTAINER_NAME = portainer

all:
	@printf "Launch configuration ${name}...\n"
	@bash srcs/requirements/wordpress/tools/mkdir_data.sh
	@docker-compose -f ./srcs/docker-compose.yml up -d
	@make portainer

build:
	@printf "Building configuration ${name}...\n"
	@bash srcs/requirements/wordpress/tools/mkdir_data.sh
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	@make portainer

portainer:
	@printf "Launching Portainer container...\n"
	@if [ -z "$$(docker ps -q -f name=${PORTAINER_NAME})" ]; then \
		docker run -d -p 8000:8000 -p 9443:9443 --name ${PORTAINER_NAME} \
		--restart=always -v /var/run/docker.sock:/var/run/docker.sock \
		-v portainer_data:/data ${PORTAINER_IMAGE}; \
	else \
		printf "Portainer container already running.\n"; \
	fi

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml down
	@make portainer-down

portainer-down:
	@printf "Stopping Portainer container...\n"
	@if [ -n "$$(docker ps -q -f name=${PORTAINER_NAME})" ]; then \
		docker stop ${PORTAINER_NAME} && docker rm ${PORTAINER_NAME}; \
	else \
		printf "Portainer container is not running.\n"; \
	fi

re:	down
	@printf "Rebuild configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	@make portainer

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY	: all build down re clean fclean portainer