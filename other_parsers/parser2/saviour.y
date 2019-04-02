%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
extern FILE *yyin;
%}




%token WHILE

%token IDENTIFIER
%token LBR
%token NUMBER
%token RBR

%token START

%token FOR
%token IN
%token TO
%token STEP

%token IF
%token ELSEIF
%token ELSE

%token OPERATOR
%token DOLLAR
%define parse.error verbose                                                                   
%%

stmt:program DOLLAR
    ;

program:START statement_list
       ;

statement_list:statement statement_list
              |
              ;

statement:decision
         |loop
         ;

decision:IF exp1 LBR exp1 ELSEIF exp1 ELSE exp1 RBR 
        ;

loop:FOR IDENTIFIER OPERATOR NUMBER TO NUMBER STEP NUMBER LBR exp1 RBR WHILE IDENTIFIER LBR exp1 RBR
    ;


exp1:IDENTIFIER OPERATOR NUMBER
    ;


   

%%



int yyerror(char *msg)
{
	printf("%s\n",msg);
	exit(0);
}

#ifdef YYDEBUG
yydebug = 1;
#endif

            
void main()
{
	//printf("\n Enter the expression:\n");
	yyin=fopen("test.txt","r");
        do{
            if(yyparse())
            {
               printf("\nFailure:\n");
               exit(0);
            }
        }while(!feof(yyin));
         
        printf("\nSuccess\n");
}

