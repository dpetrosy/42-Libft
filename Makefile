NAME			= libft.a
CC				= cc
CFLAGS			= -Wall -Wextra -Werror
AR				= ar
ARFLAGS			= -rcs
INCLUDES 		= -I.
SRCS_DIR		= .
SRCS			= $(wildcard $(SRCS_DIR)/*.c)
BSRCS			= $(wildcard $(SRCS_DIR)/ft_lst*.c)
OBJS_DIR		= $(SRCS_DIR)
OBJS			= $(patsubst $(SRCS_DIR)/%.c, $(OBJS_DIR)/%.o, $(SRCS))
BOBJS			= $(patsubst $(SRCS_DIR)/%.c, $(OBJS_DIR)/%.o, $(BSRCS))
RM				= rm -f

all : $(NAME) bonus

$(NAME) : $(OBJS)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS)

$(OBJS_DIR)/%.o : $(SRCS_DIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

bonus : $(BOBJS)
	$(AR) $(ARFLAGS) $(NAME) $(BOBJS)

clean :
	$(RM) $(OBJS)

fclean : clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all bonus clean fclean re 
