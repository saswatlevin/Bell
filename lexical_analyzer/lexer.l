%{

enum tokenType{EOFILE=-1,
RELATIONAL_OPERATOR=0,
IDENTIFIER=1,
KEYWORD=2,
INTEGER_CONSTANT=3,
BITWISE_OPERATOR=4,
ARITHMETIC_OPERATOR=5,
SPECIAL_SYMBOL=6,
MISCELLANEOUS_OPERATOR=7,
ASSIGNMENT_OPERATOR=8,
CHARACTER_CONSTANT=9,
STRING_CONSTANT=10,
FLOATING_POINT_CONSTANT=11};

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
return "RELATIONAL_OPERATOR";

case 1:
return "IDENTIFIER";

case 2:
return "KEYWORD";

case 3:
return "INTEGER_CONSTANT";

case 4:
return "BITWISE_OPERATOR";

case 5:
return "ARITHMETIC_OPERATOR";

case 6:
return "SPECIAL_SYMBOL";

case 7:
return "MISCELLANEOUS_SYMBOL";

case 8:
return "ASSIGNMENT_OPERATOR";

case 9:
return "CHARACTER_CONSTANT";

case 10:
return "STRING_CONSTANT";

case 11:
return "FLOATING_POINT_CONSTANT";

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



          

("!","&","|","<<",">>",":")      {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,BITWISE_OPERATOR);
            colno+=strlen(yytext);
            return tk;}

['^','+','*','/','-']     {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,ARITHMETIC_OPERATOR);
            colno+=strlen(yytext);
            return tk;}     


("_")       {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,IDENTIFIER);
            colno+=strlen(yytext);
            return tk;}

("++","--","exp")     {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,ARITHMETIC_OPERATOR);
            colno+=strlen(yytext);
            return tk;} 


['(',')','{','}','[',']',':']      {tk=allocToken();
                                setTokenArgs(tk,yytext,-1,lineno,colno,MISCELLANEOUS_OPERATOR);
                                colno+=strlen(yytext);
                                return tk;}


nl     {tk=allocToken();
                 setTokenArgs(tk,yytext,-1,lineno,colno,SPECIAL_SYMBOL);
                 colno+=strlen(yytext);
                 return tk;}

("=","+=","-=","*=","/=")      {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,ASSIGNMENT_OPERATOR);
            colno+=strlen(yytext);
            return tk;}

                        


"/*".*"*/" { int i=0;
               while(yytext[i]!='\0'){
                   if(yytext[i]=='\n')
        {
                            lineno++;
                            colno=1;
                    }
                    else
                        
                        colno++;
                    i++;
                }
          }
        

"//".*"\n" {lineno++;colno=1;}
(\"(.)*\") {colno+= strlen(yytext);}
(\'(.)*\') {colno+=strlen(yytext);}
\n         {lineno++;colno=1;}


['<','>']   {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,RELATIONAL_OPERATOR);
            colno+=strlen(yytext);
            return tk;
              }
(">=","<=","<=","==","!=")   {tk=allocToken();
                               setTokenArgs(tk,yytext,-1,lineno,colno,RELATIONAL_OPERATOR);         
                               colno+=strlen(yytext);
                               return tk;}



func|see|load|print|Exit|switch|if|else|elseif|ok|on {tk=allocToken();
setTokenArgs(tk,yytext,-1,lineno,colno,KEYWORD);
colno+=strlen(yytext);
return tk;}

off|while|for|do|other|but,end|next|in  {tk=allocToken();
setTokenArgs(tk,yytext,-1,lineno,colno,KEYWORD);
colno+=strlen(yytext);
return tk;}

again|and|or|not|list|get|put|give|case  {tk=allocToken();
setTokenArgs(tk,yytext,-1,lineno,colno,KEYWORD);
colno+=strlen(yytext);
return tk;}

Bye|to|bye|step|try|catch|new|From|return  {tk=allocToken();
setTokenArgs(tk,yytext,-1,lineno,colno,KEYWORD);
colno+=strlen(yytext);
return tk;}


'^'\\\n'         {tk=allocToken();
                           setTokenArgs(tk,yytext,-1,lineno,colno,CHARACTER_CONSTANT);
                           colno+=strlen(yytext);
                           return tk;}



\"(\\.|[^"\\])*\" {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,STRING_CONSTANT);
            colno+=strlen(yytext);
            return tk;} 



[0-9]+    {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,INTEGER_CONSTANT);
            colno+=strlen(yytext);
            return tk;}
             
[aA-zZ]+  {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,IDENTIFIER);
            colno+=1;
            return tk;}             
              
[0-9]+.[0-9]+ {tk=allocToken();
            setTokenArgs(tk,yytext,-1,lineno,colno,FLOATING_POINT_CONSTANT);
            colno+=strlen(yytext);
            return tk;}
             
%%

int main(int argc,char *argv[])
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
}
int yywrap(){
     return 1;
}

