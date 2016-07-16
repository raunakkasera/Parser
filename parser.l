%{
 #include "y.tab.h"
%}

%%
"main"     {printf("%s",yytext);return MAIN;}
"+"        {printf("%s",yytext);return PLUS;}
"="        {printf("%s",yytext);return EQU;}
"-"        {printf("%s",yytext);return MIN;}
"*"        {printf("%s",yytext);return STAR;}
"/"        {printf("%s",yytext);return SLASH;}
"%"        {printf("%s",yytext);return MOD;}
"!"        {printf("%s",yytext);return NOT;}
"<"        {printf("%s",yytext);return LT;}
">" 			 {printf("%s",yytext);return GT;}
"<=" 			 {printf("%s",yytext);return LE;}
">=" 			 {printf("%s",yytext);return GE;}
"==" 			 {printf("%s",yytext);return DEQU;}
"'" 			 {printf("%s",yytext);return SQT;}
"(" 			 {printf("%s",yytext);return OB;}
"[" 			 {printf("%s",yytext);return OSB;}
"]" 			 {printf("%s",yytext);return CSB;}
"#" 			 {printf("%s",yytext);return HASH;}
"include"  {printf("%s",yytext);return INCLUDE;}
"\." 			 {printf("%s",yytext);return DOT;}
")" 			 {printf("%s",yytext);return CB;}
"{" 			 {printf("%s",yytext);return OCB;}
"}" 			 {printf("%s",yytext);return CCB;}
":" 			 {printf("%s",yytext);return COL;}
";" 			 {printf("%s",yytext);return SEMI;}
"return"   {printf("%s",yytext);return RET;}
"int" 		 {printf("%s",yytext);return INT;}
"float" 	 {printf("%s",yytext);return FLOAT;}
"char"	 	 {printf("%s",yytext);return CHAR;}
"&" 			 {printf("%s",yytext);return AMP;}
"%d" 			 {printf("%s",yytext);return MODD;}
"%f" 			 {printf("%s",yytext);return MODF;}
"%s" 			 {printf("%s",yytext);return MODS;}
"," 			 {printf("%s",yytext);return COM;}
"\"" 			 {printf("%s",yytext);return DQT;}
"if" 			 {printf("%s",yytext);return IF;}
"else" 		 {printf("%s",yytext);return ELSE;}
"for" 		 {printf("%s",yytext);return FOR;}
"while" 	 {printf("%s",yytext);return WHILE;}
"do" 			 {printf("%s",yytext);return DO;}
"switch" 	 {printf("%s",yytext);return SWTC;}
"break" 	 {printf("%s",yytext);return BRK;}
"case" 		 {printf("%s",yytext);return CASE;}
"default"  {printf("%s",yytext);return DEFA;}
"void" 		 {printf("%s",yytext);return VOID;}
"printf" 	 {printf("%s",yytext);return PF;}
"scanf" 	 {printf("%s",yytext);return SF;}
\n 			   {printf("\n");}
[ \t]* 		 {printf("\t");}
[A-Za-z]*  {printf("%s",yytext);return CHR;}
[0-9]* 		 {printf("%s",yytext);return DIG;}
. 			   {return yytext[0];}
%%
