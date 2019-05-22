NAME	= fdf
CFLAGS	= -Wall -Werror -Wextra
CFLAGS	+= #-g -fsanitize=address
LDFLAGS	= -Llibft -lft -Llibmlx -lmlx -framework OpenGL -framework AppKit
INC		= -I inc -I libft/inc -I libmlx
SRC_DIR	= src
OBJ_DIR	= obj

SRC = \
	  fdf

OBJ = $(patsubst %, $(OBJ_DIR)/%.o, $(SRC))

all: $(NAME)

$(NAME): $(OBJ) lib
	@gcc $(OBJ) $(LDFLAGS) -o $(NAME)

lib:
	@make -sC libft
	@make -sC libmlx

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	@gcc $(CFLAGS) $(INC) -o $@ -c $< 

clean:
	@make -sC libft $@
	@make -sC libmlx $@
	@rm -rf $(OBJ_DIR)

fclean: clean
	@make -sC libft $@
	@rm -f $(NAME)

re: fclean all

.PHONY: lib
