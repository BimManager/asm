# libftasm Makefile

AR	:= ar
GAS	:= as
LD	:= ld

ARFLAGS	:=
ASFLAGS	:=
LDFLAGS	:= -arch x86_64 -macosx_version_min 10.13 -lc -e _main

NAME	:= test
AMBS	:= $(wildcard *.s)
OBJS	:= main.o ft_strlen.o ft_puts.o


.PHONY : all clean fclean re

all : $(NAME)

$(NAME) : $(OBJS)
	$(LD) $(LDFLAGS) $^ -o $@

%.o : %.s
	$(GAS) $(ASFLAGS) $< -o $@

clean :
	rm -f *.o

fclean : clean
	rm -f $(NAME)

re : fclean all
