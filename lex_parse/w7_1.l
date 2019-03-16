%{
  #include<stdio.h>
  #include<stdlib.h>
  #include "w7_1.tab.h"
 
%}

%%


"{"  {return LBR;}
"}"  {return RBR;}

"["  {return LSQB;}
"]"  {return RSQB;}

";" {return SEMICOLON;}
"," {return COMMA;}

"package" {return PACKAGE;}
"private" {return PRIVATE;}
"endpackage" {return ENDPACKAGE;}
"end"     {return END;}
"\n" {return NL;}


. {return PROGRAM;}

[0-9]+ {return IDENTIFIER;}
                                               
[a-zA-Z]+ {return IDENTIFIER;}
                                               

%%
int yywrap()
{
	return 1;
}


