# win64 asm Makefile

CC = ml64
LD = link
CFLAGS = /Zi /c /DDEBUG
LDFLAGS = /subsystem:windows \
		 /defaultlib:kernel32.lib \
		 /defaultlib:user32.lib /entry:Start 

HDRS = 
SRCS = msgbox.asm
OBJS = msgbox.obj
NAME = a.exe

all : $(NAME)

$(NAME) : $(OBJS)
	$(LD) $(LDFLAGS) $** /out:$@

$(OBJS)	: $(SRCS)
	$(CC) $(CFLAGS) $** 

.PNOHY : all clean fclean re

clean :
	@del /f /q *.obj

fclean : clean
	@del $(NAME)

re : fclean all	
