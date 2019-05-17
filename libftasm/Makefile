# libftasm Makefile

AR	:= ar
GAS	:= as
LD	:= ld

ARFLAGS	:= -q
GASFLAGS := -arch x86_64
LDFLAGS	:= -arch x86_64 -macosx_version_min 10.13 -lc -e _main -L./ -lftasm

NAME	:= exe.mach
ARNAME	:= libftasm.a
OBJDIR	:= objs
OBJS	:= $(addprefix $(OBJDIR)/, ft_bzero.o ft_strlen.o ft_puts.o ft_islower.o ft_is.o)
MAIN	:= $(addprefix $(OBJDIR)/, main.o)

vpath %.s : srcs

.PHONY : all clean fclean re

all : $(NAME)

$(NAME) : $(ARNAME) $(MAIN)
	$(LD) $(LDFLAGS) $^ -o $@

$(ARNAME) : $(OBJS)
	$(AR) $(ARFLAGS) $@ $^  

$(OBJDIR)/%.o : %.s $(OBJDIR)
	$(GAS) $(ASFLAGS) $< -o $@

$(MAIN) : main.s
	$(GAS) $(GASFLAGS) $< -o $@

$(OBJDIR) :
	mkdir $@

clean :
	rm -f $(OBJDIR)/*.o

fclean : clean
	rm -f $(NAME) $(ARNAME)

re : fclean all
