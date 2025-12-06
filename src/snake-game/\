# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <sys/time.h>
# include <sys/types.h>
# include <unistd.h>
# include <ncurses.h>

#define TBool   int
#define True    1 
#define False   0
#define SHAPE_FOOD  '@' 
#define SHAPE_SNAKE  '#' 
#define GAMEWIN_YLEN    15 
#define GAMEWIN_XLEN    60 
#define LOGWIN_YLEN     7 
#define LOGWIN_XLEN  (GAMEWIN_XLEN)
#define LOGBUF_NUM   (LOGWIN_YLEN-2)
#define LOGBUF_LEN   (LOGWIN_XLEN-2)
#define MAXLEVEL    12 

#define GetSnakeTail(s) ((s)->head->front)

WINDOW *logwin; //define log window
#define INITUNLOG()     logwin = newlogw()
#define RUNLOG(str)     runlog(logwin, str); //show pronpt of game using logwin(),
#define DESTROYRUNLOG() delwin(login)

int main() {
    printf("Hello World");
}
