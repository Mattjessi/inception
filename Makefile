.PHONY: all clean fclean re

all:
	@sudo docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@sudo docker compose -f ./srcs/docker-compose.yml down 

fclean: clean
	@if [ $$(sudo docker images -qa | wc -l) -ne 0 ]; then \
		sudo docker rmi -f $(shell sudo docker images -qa); \
	fi

re: fclean all