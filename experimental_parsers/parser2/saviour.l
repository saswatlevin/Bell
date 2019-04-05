    
%{
#include "w7_1.tab.h"
%}

%%


"start"   {return START;}

"while"   {return WHILE;}


"="       {return OPERATOR;}
"<"       {return OPERATOR;}
">"       {return OPERATOR;}
"<="      {return OPERATOR;}
">="      {return OPERATOR;}
"!="      {return OPERATOR;}
"and"     {return OPERATOR;}
"or"      {return OPERATOR;}
"not"     {return OPERATOR;} 


"$"      {return DOLLAR;}
                               
"{"      {return LBR;}

"}"      {return RBR;}

"if"     {return IF;}
"elseif" {return ELSEIF;}
"else"   {return ELSE;}


"for"    {return FOR;}
"in"     {return IN;}
"to"     {return TO;}
"step"   {return STEP;}


[aA-zZ]+  {return IDENTIFIER;}             
[0-9]   {return NUMBER;}              


%%

int yywrap(){
     return 1;
}
  
