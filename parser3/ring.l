%{
#include "ring.tab.h"
%}


%%


"if"      {return IF;}
"else"    {return ELSE;}
"elseif"  {return ELSEIF;}

"+"       {return OPERATOR;}
"-"       {return OPERATOR;}
"*"       {return OPERATOR;}
"/"       {return OPERATOR;}
"%"       {return OPERATOR;}
"<"       {return OPERATOR;}       
"<="      {return OPERATOR;} 
">"       {return OPERATOR;} 
">="      {return OPERATOR;} 
"="       {return OPERATOR;} 
"|"       {return OPERATOR;} 
"^"       {return OPERATOR;} 
"&"       {return OPERATOR;} 
"and"     {return OPERATOR;} 
"or"      {return OPERATOR;} 
"not"     {return OPERATOR;} 


"for"   {return FOR;}
"to"    {return TO;}
"step"  {return STEP;}

"func"  {return FUNC;}
"endfunc" {return ENDFUNC;}

"while"  {return WHILE;}
"end"    {return END;}

"do"     {return DO;}
"again"  {return AGAIN;}

"try"    {return TRY;}
"catch"  {return CATCH;}

"switch" {return SWITCH;}
"case"   {return CASE;}
"other"  {return OTHER;}

"{"      {return LBR;}
"}"      {return RBR;}

"("      {return LR;}
")"      {return RR;}

","      {return COMMA;}

"@"    {return EOP;}


[aA-zZ_0-9]+  {return IDENTIFIER;}

%%
int yywrap()
{
return 1;
}

//^\.$   
