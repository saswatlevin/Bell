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


    /* 
%{

enum tokenType{EOFILE=-1,
PROGRAM=0,
NL=1,
COMMA=2,
SEMICOLON=3,
LBR=4,
RBR=5,
LSQB=6,
RSQB=7,
DOT=8,
IDENTIFIER=9,
PACKAGE=10,
PRIVATE=11,
ENDPACKAGE=12,
END=13
};

struct token
{
char *lexeme;
int index;
unsigned int rowno,colno;
enum tokenType type;
};


char* Type(struct token* tk)
{
switch(tk->type)
{
case 0:
return "PROGRAM";

case 1:
return "NL";

case 2:
return "COMMA";

case 3:
return "SEMICOLON";

case 4:
return "LBR";

case 5:
return "RBR";

case 6:
return "LSQB";

case 7:
return "RSQB";

case 8:
return "DOT";

case 9:
return "IDENTIFIER";

case 10:
return "PACKAGE";

case 11:
return "PRIVATE";

case 12:
return "ENDPACKAGE";

case 13:
return "END";

default:
return "UNIDENTIFIED";

}

}
 



#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define YY_DECL struct token *yylex(void)

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


void setTokenArgs(struct token *tk,char *lexeme,int index,int rowno,int colno,enum tokenType type)
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



"\n"     {tk=allocToken();
                 setTokenArgs(tk,yytext,-1,lineno,colno,NL);
                 colno+=strlen(yytext);
                 return tk;}



"private"      {tk=allocToken();
                setTokenArgs(tk,yytext,-1,lineno,colno,PRIVATE);
                colno+=strlen(yytext);
                return tk;}



"package"      {tk=allocToken();
                setTokenArgs(tk,yytext,-1,lineno,colno,PACKAGE);
                colno+=strlen(yytext);
                return tk;}


"end"      {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,END);
            colno+=strlen(yytext);
            return tk;}

"endpackage"      {tk=allocToken();
                   setTokenArgs(tk,yytext,-1,lineno,colno,ENDPACKAGE);
                   colno+=strlen(yytext);
                   return tk;}
        

"{"      {tk=allocToken();
          setTokenArgs(tk,yytext,-1,lineno,colno,LBR);
          colno+=strlen(yytext);
          return tk;}


"}"      {tk=allocToken();
          setTokenArgs(tk,yytext,-1,lineno,colno,RBR);
          colno+=strlen(yytext);
          return tk;}

"["      {tk=allocToken();
          setTokenArgs(tk,yytext,-1,lineno,colno,LSQB);
          colno+=strlen(yytext);
          return tk;}

"]"      {tk=allocToken();
          setTokenArgs(tk,yytext,-1,lineno,colno,RSQB);
          colno+=strlen(yytext);
          return tk;}

 /*"."      {tk=allocToken();
          setTokenArgs(tk,yytext,-1,lineno,colno,DOT);
          colno+=strlen(yytext);
          return tk;}*/


[aA-zZ]+  {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,IDENTIFIER);
            colno+=1;
            return tk;}             
              
          
.  {tk=allocToken();
    setTokenArgs(tk,yytext,-1,lineno,colno,PROGRAM);
    colno+=strlen(yytext);
    return tk;}

%%

/*int main(int argc,char *argv[])
{



   if(argc<2){
         printf("This program requires name of one ring file");
         exit(0);
   }
   //yyin=fopen(argv[1],"r");
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
  
