    
%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "w7_1.tab.h"
#define YY_DECL struct token *yylex(void)

struct token
{
char *lexeme;
int index;
unsigned int rowno,colno;
enum yytokentype type;
};


char* Type(struct token* tk)
{
switch(tk->type)
{   /*SEE = 272,
    LOOP = 273,
    CHANGE_RING_OPERATOR = 274,
    CHANGE_RING_KEYWORD = 275,
    IF = 276,
    GET = 277,
    GIVE = 278,
    LOAD = 279,
    LOADSYNTAX = 280,
    FOR = 281,
    WHILE = 282,
    DO = 283,
    RETURN = 284,
    TRY = 285,
    IMPORT = 286,
    EXIT = 287,
    BYE = 288*/
case 258:
return "PROGRAM";

case 259:
return "NL";

case 260:
return "COMMA";

case 261:
return "SEMICOLON";

case 262:
return "LBR";

case 263:
return "RBR";

case 264:                                            
return "LSQB";

case 265:
return "RSQB";

case 266:
return "DOT";

case 267:
return "IDENTIFIER";

case 268:
return "PACKAGE";

case 269:
return "PRIVATE";

case 270:
return "ENDPACKAGE";

case 271:
return "END";

case 272:
return "LOOP";

case 273:
return "LOOP";

case 274:
return "CHANGE_RING_OPERATOR";

case 275:
return "CHANGE_RING_KEYWORD";

case 276:
return "IF";

case 277:
return "GET";

case 278:
return "GIVE";

case 279:
return "LOAD";

case 280:
return "LOADSYNTAX";

case 281:
return "FOR";

case 282:
return "WHILE";

case 283:
return "DO";

case 284:
return "RETURN";

case 285:
return "TRY";

case 286:
return "IMPORT";

case 287:
return "EXIT";

case 288:
return "BYE";

case 289:
return "DEF";

case 290:
return "ENDFUNC";

case 291:
return "SWITCH";

case 292:
return "LITERAL";

default:
return "UNIDENTIFIED";

}

}
 







int lineno=1,colno=1;
struct token *tk;
struct token* allocToken(){
struct token* tk;
tk=(struct token*)malloc(sizeof(struct token));
tk->lexeme=(char*)malloc(sizeof(char)*3);


    
    tk->index=-1;
    tk->type=EOFILE;
    return tk;

}


void setTokenArgs(struct token *tk,char *lexeme,int index,int rowno,int colno,enum yytokentype type)
{

if(tk==NULL)
     return;

strcpy(tk->lexeme,lexeme);
tk->index=index;
tk->rowno=rowno;
tk->colno=colno;
tk->type=type;
}
%}

%%


"{"      {tk=allocToken();
          setTokenArgs(tk,yytext,-1,lineno,colno,LBR);
          colno+=strlen(yytext);
          return LBR;}


"}"      {tk=allocToken();
          setTokenArgs(tk,yytext,-1,lineno,colno,RBR);
          colno+=strlen(yytext);
          return RBR;}

"["      {tk=allocToken();
          setTokenArgs(tk,yytext,-1,lineno,colno,LSQB);
          colno+=strlen(yytext);
          return LSQB;}

"]"      {tk=allocToken();
          setTokenArgs(tk,yytext,-1,lineno,colno,RSQB);
          colno+=strlen(yytext);
          return RSQB;}


"private"      {tk=allocToken();
                setTokenArgs(tk,yytext,-1,lineno,colno,PRIVATE);
                colno+=strlen(yytext);
                return PRIVATE;}



"package"      {tk=allocToken();
                setTokenArgs(tk,yytext,-1,lineno,colno,PACKAGE);
                colno+=strlen(yytext);
                return PACKAGE;}


"endpackage"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,ENDPACKAGE);
                   colno+=strlen(yytext);
                   return ENDPACKAGE;}

"end"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,END);
                   colno+=strlen(yytext);
                   return END;}

"load"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,LOAD);
                   colno+=strlen(yytext);
                   return LOAD;}
                
"loadsyntax"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,LOADSYNTAX);
                   colno+=strlen(yytext);
                   return LOADSYNTAX;}
        
"see"             {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,SEE);
                   colno+=strlen(yytext);
                   return SEE;}

"import"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,IMPORT);
                   colno+=strlen(yytext);
                   return IMPORT;}


"changeringoperator"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,CHANGE_RING_OPERATOR);
                   colno+=strlen(yytext);                                                         
                   return CHANGE_RING_OPERATOR ;}

"changeringkeyword"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,CHANGE_RING_KEYWORD);
                   colno+=strlen(yytext);
                   return CHANGE_RING_KEYWORD ;}

"give"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,GIVE);
                   colno+=strlen(yytext);
                   return GIVE ;}

"get"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,GIVE);
                   colno+=strlen(yytext);
                   return GET;}

"if"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,IF);
                   colno+=strlen(yytext);
                   return IF;}

"for"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,FOR);
                   colno+=strlen(yytext);
                   return FOR;}

"Switch"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,SWITCH);
                   colno+=strlen(yytext);
                   return SWITCH;}

"do"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,DO);
                   colno+=strlen(yytext);
                   return DO;}

"try"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,TRY);
                   colno+=strlen(yytext);
                   return TRY;}

"return"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,RETURN);
                   colno+=strlen(yytext);
                   return RETURN;}

"loop"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,LOOP);
                   colno+=strlen(yytext);
                   return LOOP;}
"exit"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,EXIT);
                   colno+=strlen(yytext);
                   return EXIT;}

"bye"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,BYE);
                   colno+=strlen(yytext);
                   return BYE;}

"def"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,DEF);
                   colno+=strlen(yytext);
                   return DEF;}

"endfunc"  {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,ENDFUNC);
                   colno+=strlen(yytext);
                   return ENDFUNC;}


"\n"     {tk=allocToken();
                 setTokenArgs(tk,yytext,-1,lineno,colno,NL);
                 colno+=strlen(yytext);
                 return NL;}


"\""([^\n\"\\]*(\\[.\n])*)*"\""   {tk=allocToken();
                 setTokenArgs(tk,yytext,-1,lineno,colno,LITERAL);
                 colno+=strlen(yytext);
                 return LITERAL;} 


.       {tk=allocToken();
          setTokenArgs(tk,yytext,-1,lineno,colno,PROGRAM);
          colno+=strlen(yytext);
          return PROGRAM;}


[0-9]+  {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,IDENTIFIER);
            colno+=strlen(yytext);
            return IDENTIFIER;}    


[aA-zZ]+  {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,IDENTIFIER);
            colno+=strlen(yytext);
            return IDENTIFIER;}             
              
%%

 /*int main(int argc,char *argv[])
{



   if(argc<2){
         printf("This program requires name of one ring file");
         exit(0);
   }
   yyin=fopen(argv[1],"r");
   int cnt=0;
   while(tk=yylex()){
        printf("\n%d\t\t%s\t\t%d\t\t%d\t\t%s\n\n",cnt,tk->lexeme,tk->rowno,tk->colno,Type(tk));
        fflush(stdout);
        cnt++;
   //INSERT(tk);
   }
return 0;
}*/

int yywrap(){
     return 1;
}
  
