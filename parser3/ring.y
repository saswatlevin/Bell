%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
extern FILE *yyin;
%}

%token IF
%token ELSE
%token ELSEIF

%token FOR
%token TO
%token STEP

%token FUNC
%token ENDFUNC

%token IDENTIFIER
%token OPERATOR

%token LBR 
%token RBR

%token COMMA

%token LR
%token RR

%token EOP
%define parse.error verbose 
%%
stmt:program EOP
    ;

program:Statement
       ;

Statement:if_statement
	|for_loop
        |function_statement
        |expr
        ;

if_statement:IF expr lbr_d stmt_prime_4 elseif_expr_stmt_p else_STMT_d RBR Statement
	;

for_loop:FOR expr TO expr step_expr_d lbr_d2 STMT_prime_3 RBR Statement
	;

function_statement:FUNC IDENTIFIER paralist_d lbr_stmt_rbr_d2 ENDFUNC
	;

paralist_d:lr_d IDENTIFIER COMMA IDENTIFIER rr_d
	|
        ;

lr_d:LR
    |
    ;

rr_d:RR
    |	
    ;

lbr_stmt_rbr_d2:LBR stmt_prime_3 RBR
        |
	;
stmt_prime_3:stmt_prime_3 IDENTIFIER
	|stmt_prime_3 expr
        |	
	;


step_expr_d:STEP expr
	|
	;

lbr_d2:LBR
	|
	;


STMT_prime_3:STMT_prime_3 Statement
	|
	;
lbr_d:LBR
	|
	;

stmt_prime_4:stmt_prime_4 IDENTIFIER
        |stmt_prime_4 expr
	|
	;

elseif_expr_stmt_p:elseif_expr_stmt_p ELSEIF expr STMT_p
	|	
	;

STMT_p:STMT_p Statement
	|	
	;

else_STMT_d:ELSE STMT_prime_1
	|
	;

STMT_prime_1:STMT_prime_1 Statement
	|	
	;

expr:IDENTIFIER OPERATOR IDENTIFIER	
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

