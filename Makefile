# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: susami </var/mail/susami>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/21 11:23:06 by susami            #+#    #+#              #
#    Updated: 2022/06/21 16:21:26 by susami           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	pjt_name
CFLAGS		=	-Wall -Wextra -Werror
INCLUDES	=	-Iinclude

LIBFTDIR	=	libft
LIBFT		=	$(LIBFTDIR)/libft.a
LIBS		=	-L $(LIBFTDIR) -lft

SRCS		=	src/main.c
OBJDIR		=	obj
OBJS		=	$(SRCS:%.c=$(OBJDIR)/%.o)

.PHONY: all clean fclean re bonus
all: $(NAME)

$(NAME): $(OBJS) $(LIBFT)
	$(CC) $(CFLAGS) $(INCLUDES) $(LIBS) -o $(NAME) $(OBJS)

$(OBJDIR)/%.o: %.c
	mkdir -p $(@D)
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<

clean:
	$(RM) *.o *.out
	$(RM) -r $(OBJDIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

bonus:

.PHONY: libft
libft:
	$(MAKE) -C $(LIBFTDIR) re

$(LIBFT):
	$(MAKE) -C $(LIBFTDIR)

