%{
#include "ring.tab.h"
char arr[100];
int i = 0;
int flag = 0;
%}


%%


"if"      {yylval.str = strdup(yytext);return IF;}
"else"    {yylval.str = strdup(yytext);return ELSE;}
"elseif"  {yylval.str = strdup(yytext);return ELSEIF;}

"+"       {yylval.str = strdup(yytext);return OPERATOR;}
"-"       {yylval.str = strdup(yytext);return OPERATOR;}
"*"       {yylval.str = strdup(yytext);return OPERATOR;}
"/"       {yylval.str = strdup(yytext);return OPERATOR;}
"%"       {yylval.str = strdup(yytext);return OPERATOR;}
"<"       {yylval.str = strdup(yytext);return OPERATOR;}       
"<="      {yylval.str = strdup(yytext);return OPERATOR;} 
">"       {yylval.str = strdup(yytext);return OPERATOR;} 
">="      {yylval.str = strdup(yytext);return OPERATOR;} 
"="       {yylval.str = strdup(yytext);return OPERATOR;} 
"|"       {yylval.str = strdup(yytext);return OPERATOR;} 
"^"       {yylval.str = strdup(yytext);return OPERATOR;} 
"&"       {yylval.str = strdup(yytext);return OPERATOR;} 
"and"     {yylval.str = strdup(yytext);return OPERATOR;} 
"or"      {yylval.str = strdup(yytext);return OPERATOR;} 
"not"     {yylval.str = strdup(yytext);return OPERATOR;} 


"for"   {yylval.str = strdup(yytext);return FOR;}
"to"    {yylval.str = strdup(yytext);return TO;}
"step"  {yylval.str = strdup(yytext);return STEP;}

"func"  {yylval.str = strdup(yytext);return FUNC;}
"endfunc" {yylval.str = strdup(yytext);return ENDFUNC;}

"while"  {yylval.str = strdup(yytext);return WHILE;}
"end"    {yylval.str = strdup(yytext);return END;}

"do"     {yylval.str = strdup(yytext);return DO;}
"again"  {yylval.str = strdup(yytext);return AGAIN;}

"try"    {yylval.str = strdup(yytext);return TRY;}
"catch"  {yylval.str = strdup(yytext);return CATCH;}

"switch" {yylval.str = strdup(yytext);return SWITCH;}
"case"   {yylval.str = strdup(yytext);return CASE;}
"other"  {yylval.str = strdup(yytext);return OTHER;}

"package" {yylval.str = strdup(yytext);return PACKAGE;}
"."       {yylval.str = strdup(yytext);return DOT;}
"endpackage" {yylval.str = strdup(yytext);return ENDPACKAGE;}

"see"    {yylval.str = strdup(yytext);return SEE;}

"give"   {yylval.str = strdup(yytext);return GIVE;}

"class"  {yylval.str = strdup(yytext);return CLASS;}
"from"   {yylval.str = strdup(yytext);return FROM;}
"endclass" {yylval.str = strdup(yytext);return ENDCLASS;}

"load"   {yylval.str = strdup(yytext);return LOAD;}

"\""([^\n\"\\]*(\\[.\n])*)*"\""  {yylval.str = strdup(yytext);return LITERAL;}

"{"      {yylval.str = strdup(yytext);return LBR;}
"}"      {yylval.str = strdup(yytext);return RBR;}

"("      {yylval.str = strdup(yytext);return LR;}
")"      {yylval.str = strdup(yytext);return RR;}

","      {yylval.str = strdup(yytext);return COMMA;}

"@"    {yylval.str = strdup(yytext);return EOP;}


[aA-zZ_0-9]+  {yylval.str = strdup(yytext);return IDENTIFIER;}



%%
void yyerror(char *msg) {
    printf("error\n");
    // printf("%s\n", msg);
    
    printf("line number: %d, msg: %s, char: %s\n", yylineno, msg, yytext );
}



int yywrap()
{
return 1;
}

//^\.$   
