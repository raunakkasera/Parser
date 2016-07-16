%{
#include<stdio.h>
int flag=0;
extern FILE *yyin;
%}

%token OB CB OSB CSB OCB CCB SEMI INT VOID PF SF MAIN 
             FLOAT  CHAR PLUS MIN STAR SLASH
             MOD NOT LT GT LE GE DEQU SQT CHR DIG HASH INCLUDE DOT 
             EQU AMP MODD MODF MODS COM
             IF ELSE FOR WHILE DO SWTC BRK CASE DEFA EXP DQT COL

%%
T: A  {flag=1;printf("\n\n the entered c program is valid  \n\n\n\n"); return 0;}
A: HASH INCLUDE LT CHR DOT CHR GT A | S ; 
S:        type MAIN OB CB OCB stmt1 ret CCB ;
ret:      RET DIG SEMI | ;
type:   VOID | INT | ;
decl:    type1 ptr CHR ext stmt1 ;
ptr:      STAR | ;
ext:     OSB DIG CSB ext | COM ptr CHR ext | SEMI | assin ;
assin:  EQU dig ext1 ;
ext1:    ext ;
dig:     DIG |DIG DOT DIG exp2 | ;
type1: INT | FLOAT | CHAR ;

stmt1: OCB stmt1  CCB | decl | io | exp | branch | loop ;
io:       print | read ;
exp:    exp1 SEMI anythin ;

exp1: CHR EQU exp2 | exp2 ;
exp2: exp3 sign exp2 | OB exp2 CB exp2 | exp4 | exp3 ;
exp4 : exp3 sign1 | sign1 exp3 ;
sign1: add | sub ;
exp3: CHR | dig ;
sign:   PLUS | EQU | MIN | STAR | SLASH | LT | GT | LE | GE | DEQU | ob ;
ob:     OB argl CB ;
argl:   CHR COM argl | exp3 ;
print:  PF OB DQT string DQT paral CB SEMI anythin ; 
string: CHR ;
paral:  COM CHR paral | ;
read:    SF OB DQT format DQT params CB SEMI anythin ;
format:  mod format | ;
mod:     MODD | MODF | MODS ; 
params: COM AMP CHR params | ;
branch:  iff | switchh ;
iff:         IF OB cond CB inif els ;
inif:       anythin ;
els:        ELSE anythin | ;
switchh: SWTC OB CHR CB OCB swstmts CCB ;
swstmts:  CASE SQT CHR SQT COL stmt1 BRK SEMI swstmts| DEFA COL print | ;
loop:      forlp | whilelp ;


forlp:               FOR OB ass SEMI cond SEMI incr CB infor ;
infor: 	 	   OCB anythin CCB | anythin ;
anythin:	   stmt1 | ;
ass: 		   CHR EQU DIG ;
whilelp: 	   WHILE OB cond CB inwhile ;
inwhile:	   OCB anythin CCB | anythin ;
cond: 		   CHR sign num ;
num:		   CHR | DIG ;
incr: 		   CHR add | CHR sub ;
add: 		   PLUS PLUS ;
sub: 	             MIN MIN ;

%%
int main()
   {
FILE *fp;
int ch;
char fname[20];
printf("\n enter 1 : to read program from a file \n 2 : exit\n");
scanf("%d",&ch);
switch(ch){
    case 1 : 
           printf("\n enter the file name\n ");
           scanf("%s",fname);
           fp = fopen(fname,"r");
           yyin = fp;
           yyparse();
           fclose(fp);
           break;
    case 2 : exit(0);
       }
 return 0;
}

int yyerror()
{
 if(flag==0)
   printf("\n  invalid prog \n ");
return 0;
}
