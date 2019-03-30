    
%{
#include "w7_1.tab.h"
%}

%%



"("      {return LR;}

")"      {return RR;}

"{"      {return LBR;}


"}"      {return RBR;}

"["      {return LSQB;}

"]"      {return RSQB;}


"private"      {return PRIVATE;}



"package"      {return PACKAGE;}


"endpackage"      {return ENDPACKAGE;}

"end"      {return END;}

"load"      {return LOAD;}
                
"loadsyntax"      {return LOADSYNTAX;}
        
"import"      {return IMPORT;}


"changeringoperator"      {return CHANGE_RING_OPERATOR ;}

"changeringkeyword"      {return CHANGE_RING_KEYWORD ;}

"give"      {return GIVE ;}

"get"      {return GET;}

"if"      {return IF;}

"for"      {return FOR;}

"Switch"      {return SWITCH;}

"do"      {return DO;}

"try"      {return TRY;}

"return"      {return RETURN;}

"loop"      {return LOOP;}

"exit"      {return EXIT;}

"bye"      {return BYE;}

"def"      {return DEF;}

"func"     {return FUNC;}

"endfunc"  {return ENDFUNC;}

"class"    {return CLASS;}

"endclass" {return ENDCLASS;}

"endwhile" {return ENDWHILE;}

"from"     {return FROM;}

"see"      {return SEE;}

"put"      {return PUT;}

"but"      {return BUT;}

"else"     {return ELSE;}

"elseif"   {return ELSEIF;}

"new"      {return NEW;}

"other"    {return OTHER;}

"call"     {return CALL;}

"case"     {return CASE;} 

"ok"       {return OK;}

"on"       {return ON;}

"nl"       {return NL;}



"<<"       {return SHIFT_LEFT;}

">>"       {return SHIFT_RIGHT;}




"+"        {return ADDOP;}
"-"        {return ADDOP;}

"*"        {return MULOP;}
"/"        {return MULOP;}
"%"        {return MULOP;}



"and"      {return LOGOP;}
"|"        {return LOGOP;}
"&"        {return LOGOP;}
"or"       {return LOGOP;}
"not"      {return LOGOP;}

"="       {return RELOP;}
"!="      {return RELOP;}
"<="      {return RELOP;}
">="      {return RELOP;}
"<"       {return RELOP;}
">"       {return RELOP;}


","      {return COMMA;}
":"      {return COLON;}
";"      {return SS;}
"$"      {return DOLLAR;}
    

["][^"]*["] {return LITERAL;} //For multi-line strings

[ \t\n]+                                                                          

^\.$    {return DOT;} //For a single dot

[0-9]  {return NUMBER;}    


[aA-zZ]+  {return IDENTIFIER;}    

%%

int yywrap(){
     return 1;
}
  /*"\""([^\n\"\\]*(\\[.\n])*)*"\""   {return LITERAL;}*/
