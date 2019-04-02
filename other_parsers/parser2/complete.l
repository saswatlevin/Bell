    
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

"to"       {return TO;}

"step"     {return STEP;}

"on"       {return ON;}

"start"    {return START;}

"nl"       {return NL;}



"<<"       {return SHIFT_LEFT;}

">>"       {return SHIFT_RIGHT;}




"+"        {return PLUS;}
"-"        {return MINUS;}

"*"        {return INTO;}
"/"        {return BY;}
"%"        {return MODULUS;}



"and"      {return AND;}
"|"        {return XOR;}
"&"        {return AND;}
"or"       {return OR;}
"not"      {return NOT;}

"="       {return EQUAL;}


"!="      {return NE;}
"<="      {return LE;}
">="      {return GE;}
"<"       {return LT;}
">"       {return GT;}


","      {return COMMA;}
":"      {return COLON;}
";"      {return SS;}
"$"      {return DOLLAR;}
    

["][^"]*["] {return LITERAL;} //For multi-line strings

[ \t\n]+                                                                          

^\.$    {return DOT;} //For a single dot

[aA-zZ]+  {return IDENTIFIER;}             
[0-9]+   {return NUMBER;}              

/*"\""([^\n\"\\]*(\\[.\n])*)*"\""   {return LITERAL;}

%%

int yywrap(){
     return 1;
}
 
