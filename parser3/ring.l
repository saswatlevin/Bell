%{
#include "ring.tab.h"
%}


%%


"if"      {return IF;}
"else"    {return ELSE;}
"elseif"  {return ELSEIF;}


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


"{"      {return LBR;}
"}"      {return RBR;}

"@"    {return EOP;}


[aA-zZ]+  {return IDENTIFIER;}

%%
int yywrap()
{
return 1;
}

//^\.$   
