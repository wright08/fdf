NAME = fdf
LIB = libft.a
LIB_DIR = lib
CFLAGS = -Wall -Werror -Wextra
CFLAGS += #-g -fsanitize=address
INC = -I inc -I $(LIB_DIR)/inc
SRC_DIR = src
OBJ_DIR = obj

SRC = \
	  fdf

OBJ = $(patsubst %, $(OBJ_DIR)/%.o, $(SRC))

all: checker push_swap

$(NAME): $(OBJ)
	gcc $(OBJ) $(LIB) -o $(NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	gcc $(CFLAGS) $(INC) -o $@ -c $< 

$(LIB_DIR)/$(LIB):
	@make -sC $(LIB_DIR)

clean:
	@make -sC $(LIB_DIR) $@
	@rm -rf $(OBJ_DIR)

fclean: clean
	@make -sC $(LIB_DIR) $@
	@rm -f checker
	@rm -f push_swap

re: fclean all
