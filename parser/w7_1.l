
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
{
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
        


"\n"     {tk=allocToken();
                 setTokenArgs(tk,yytext,-1,lineno,colno,NL);
                 colno+=strlen(yytext);
                 return NL;}


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
  
