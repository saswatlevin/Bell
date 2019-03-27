    
%{
#include "w7_1.tab.h"
%}

%%

"<"      {return LT;}

">"       {return GT;}

"<="      {return LE;}

">="      {return GE;}

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

"nl"       {return NL;}


"and"      {return AND;}
"or"       {return OR;}

"not"      {return LOGICNOT;}

","      {return COMMA;}
":"      {return COLON;}
";"      {return SS;}
"$"     {return DOLLAR;}
    

"\""([^\n\"\\]*(\\[.\n])*)*"\""   {return LITERAL;}

^\.$    {return DOT;}

[0-9]  {return IDENTIFIER;}    


[aA-zZ]+  {return IDENTIFIER;}    

%%

int yywrap(){
     return 1;
}
  
