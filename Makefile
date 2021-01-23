NAME = gnl_lib.a

SRC_D = src
INC_D = inc
OBJ_D = obj

SRC = $(SRC_D)/get_next_line.c\
	$(SRC_D)/get_next_line_utils.c

INC = $(INC_D)/get_next_line.h

OBJ := $(SRC:$(SRC_D)/%.c=$(OBJ_D)/%.o)

CC = clang
LD = ar

CC_FLAGS = -Wall -Werror -Wextra
#CC_FLAGS = -Wall -Werror -Wextra -g -fsanitize=address
LD_FLAGS = -rcs

all: $(NAME)

$(NAME): $(OBJ_D) $(OBJ) $(INC_D) $(INC)
	@$(LD) $(LD_FLAGS) $(NAME) $(OBJ)

$(OBJ_D):
	@mkdir -p $(OBJ_D)

$(OBJ): $(OBJ_D)/%.o: $(SRC_D)/%.c
	@$(CC) $(CC_FLAGS) -I$(INC_D) -c $< -o $@

clean:
	@rm -rf $(OBJ_D)

fclean: clean
	@rm -f $(NAME)
	@rm -f test

test: $(NAME)
	@$(CC) $(CC_FLAGS) -I$(INC_D) -o test tests/main.c $(NAME)
	@./test

re : fclean all
