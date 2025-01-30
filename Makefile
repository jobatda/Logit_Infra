BLUE=\033[0;34m
NC=\033[0m

FE_URL = https://github.com/jobatda/Logit_FE.git
BE_URL = https://github.com/jobatda/Logit_BE.git

FE_NAME = Logit_FE
BE_NAME = Logit_BE

FE_PATH = ./frontend
BE_PATH = ./backend

clone-fe:
	@if [ ! -d "$(FE_PATH)/$(FE_NAME)" ]; then \
		echo "Cloning Frontend repository..."; \
		git clone $(FE_URL) $(FE_PATH)/$(FE_NAME); \
	else \
		echo "Frontend repository already exists in $(FE_PATH)/$(FE_NAME)"; \
	fi

clone-be:
	@if [ ! -d "$(BE_PATH)/$(BE_NAME)" ]; then \
		echo "Cloning Backend repository..."; \
		git clone $(BE_URL) $(BE_PATH)/$(BE_NAME); \
	else \
		echo "Backend repository already exists in $(BE_PATH)/$(BE_NAME)"; \
	fi
# Front / Back 레포 생성 명령어

rm-fe:
	@if [ ! -d "$(FE_PATH)/$(FE_NAME)" ]; then \
		echo "Already cleaned Frontend repository..."; \
	else \
		rm -rf $(FE_PATH)/$(FE_NAME); \
		echo "Clean Complete."; \
	fi

rm-be:
	@if [ ! -d "$(BE_PATH)/$(BE_NAME)" ]; then \
		echo "Already cleaned Backend repository..."; \
	else \
		rm -rf $(BE_PATH)/$(BE_NAME); \
		echo "Clean Complete."; \
	fi
# Front / Back 레포 삭제 명령어


clone-all: clone-fe clone-be
# 레포 일괄생성

rm-all: rm-fe rm-be
# 레포 일괄삭제

up: clone-all
	-@docker-compose up --build -d

down:
	-@docker-compose down 

ls:
	@echo "${BLUE}[ DOCKER CONTAINERS ]${NC}"
	@ docker-compose ps -a
	@echo "\n${BLUE}[ DOCKER IMAGES ]${NC}"
	@ docker-compose images
	@echo "\n${BLUE}[ DOCKER VOLUMES ]${NC}"
	@docker volume ls
	@echo "\n${BLUE}[ DOCKER NETWORKS ]${NC}"
	@docker network ls

in_nginx:
	@docker exec -it nginx /bin/sh
# nginx 컨테이너에 shell로 접근

in_db:
	@docker exec -it db /bin/sh
# db 컨테이너에 shell로 접근

in_backend:
	@docker exec -it backend /bin/sh
# backend 컨테이너에 shell로 접근

clean:
	-@ docker-compose down --volumes --rmi all

fclean: clean
	-@ docker system prune

re: fclean up