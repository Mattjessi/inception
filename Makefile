.PHONY: all clean fclean re

all:
	@if [ ! -d "/home/${USER}/data/wordpress_website_files" ]; then \
		mkdir -p "/home/${USER}/data/wordpress_website_files"; \
	fi
	@sudo docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@sudo docker compose -f ./srcs/docker-compose.yml down 

fclean: clean
	@if [ $$(sudo docker images -qa | wc -l) -ne 0 ]; then \
		sudo docker rmi -f $(shell sudo docker images -qa); \
	fi

	@if [ $$(sudo docker network ls -q | wc -l) -ne 0 ]; then \
		sudo docker network prune -f; \
	fi

re: fclean all
