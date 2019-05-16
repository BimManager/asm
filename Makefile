# playground Makefile

GAS	:= as
GASFLAGS := -arch x86_64
LD	:= ld
LDFLAGS	:= -arch x86_64 -macosx_version_min 10.13 -lc -e _main


NAME	:= $(EXE)
OBJS	:= $(NAME).o
SRCS	:= $(NAME).s

all : $(NAME)

$(NAME) : $(OBJS)
	$(LD) $(LDFLAGS) $^ -o $@

$(OBJS) : $(SRCS)
	$(GAS) $(GASFLAGS) $^ -o $@

.PHONY : all clean fclean re

clean :
	rm -f $(OBJS)
fclean : clean
	rm -f $(NAME)

re : fclean all
