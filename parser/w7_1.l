    
%{
#include "w7_1.tab.h"
%}

%%

"="       {return EQUAL;}
"!="      {return NE;}

"<="      {return LE;}

">="      {return GE;}

"<"      {return LT;}

">"       {return GT;}


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

"from"     {return FROM;}

"see"      {return SEE;}

"put"      {return PUT;}

"but"      {return BUT;}

"else"     {return ELSE;}

"elseif"   {return ELSEIF;}

"new"      {return NEW;}

"call"     {return CALL;}

"ok"       {return OK;}

"nl"       {return NL;}


"and"      {return AND;}

"|"        {return BXOR;}

"&"        {return XAND;}

"<<"       {return SHIFT_LEFT;}

">>"       {return SHIFT_RIGHT;}

"+"        {return PLUS;}

"-"        {return MINUS;}

"*"        {return INTO;}

"/"        {return BY;}

"%"        {return MODULUS;}

"^"        {return EXP;}

"or"       {return OR;}

"not"      {return NOT;}

","      {return COMMA;}
":"      {return COLON;}
";"      {return SS;}
"$"     {return DOLLAR;}
    

"\""([^\n\"\\]*(\\[.\n])*)*"\""   {return LITERAL;}

^\.$    {return DOT;}

[0-9]  {return NUMBER;}    


[aA-zZ]+  {return LETTER;}    

%%

int yywrap(){
     return 1;
}
  
