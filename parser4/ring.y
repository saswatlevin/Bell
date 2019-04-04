%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
extern FILE *yyin;
extern char arr[100];
extern int i;
%}

%union {
    char *str;
}

%token <str>IF
%token <str>ELSE
%token <str>ELSEIF

%token <str>FOR
%token <str>TO
%token <str>STEP

%token <str>FUNC
%token <str>ENDFUNC

%token <str>WHILE
%token <str>END

%token <str>DO
%token <str>AGAIN

%token <str>TRY
%token <str>CATCH

%token <str>SWITCH
%token <str>CASE
%token <str>OTHER

%token <str>PACKAGE
%token <str>DOT
%token <str>ENDPACKAGE

%token <str>SEE
%token <str>LITERAL 

%token <str>GIVE

%token <str>CLASS
%token <str>FROM
%token <str>ENDCLASS

%token <str>LOAD

%token <str>IDENTIFIER
%token <str>OPERATOR

%token <str>LBR 
%token <str>RBR

%token <str>COMMA

%token <str>LR
%token <str>RR

%token <str>EOP
%define parse.error verbose 
%%
stmt:program EOP
    ;

program:Statement
       ;

Statement:if_statement
	|for_loop
        |function_statement
        |while_loop
        |do_again_loop
        |try_catch_statement
        |switch_statement
        |package_statement
        |see_statement
        |give_statement
        |class_statement
        |load_statement
        |expr
        ;

if_statement:IF expr lbr_d stmt_prime_4 elseif_expr_stmt_p else_STMT_d RBR Statement {printf("%s", $1);}
	;

for_loop:FOR expr TO expr step_expr_d lbr_d2 STMT_prime_3 RBR Statement {printf("%s", $1);
                                                                          printf("%s",$3);
                                                                          printf("%s",$8);}
	;

while_loop:WHILE expr lbr_d4 stmt_prime_7 RBR Statement {printf("%s", $1);
                                                         printf("%s",$5);}
	;

do_again_loop:DO stmt_prime_8 AGAIN expr Statement 	
	;


try_catch_statement:TRY stmt_prime_9 lbr_d5 CATCH stmt_prime_10 RBR Statement 
	;

switch_statement:SWITCH expr lbr_d1 case_expr_statement_p other_STMT_d RBR Statement 
	;

package_statement:PACKAGE IDENTIFIER dot_id_p lbr_stmt_rbr_d ENDPACKAGE Statement    
	;

see_statement:SEE expr Statement
	|SEE LITERAL Statement
	;

give_statement:GIVE expr Statement
	|GIVE LITERAL Statement
        ;

class_statement:CLASS IDENTIFIER from_colon_lt_id_prime lbr_stmt_rbr_d1 ENDCLASS Statement
	;

load_statement:LOAD PACKAGE LITERAL
	;

from_colon_lt_id_prime:FROM IDENTIFIER
        |	
	;

lbr_stmt_rbr_d1: LBR stmt_prime_2 RBR
	|
	;

stmt_prime_2:stmt_prime_2 IDENTIFIER
	|stmt_prime_2 expr
	|
	;

dot_id_p:DOT IDENTIFIER dot_id_p 
	|	
	;

lbr_stmt_rbr_d:LBR stmt_prime_1 RBR
	|
	;

stmt_prime_1:stmt_prime_1 IDENTIFIER
	|stmt_prime_1 expr
	|	
	;

lbr_d1:LBR
      |
      ;

case_expr_statement_p:case_expr_statement_p CASE expr stmt_prime_5	
	|	
	;

other_STMT_d:OTHER STMT_prime_2
	|
	;

STMT_prime_2:STMT_prime_2 Statement
	|
	;

stmt_prime_5:stmt_prime_5 IDENTIFIER
	|stmt_prime_5 expr
	|	
	;

stmt_prime_9:stmt_prime_9 IDENTIFIER
	|stmt_prime_9 expr
	|
	;

lbr_d5:LBR
	|	
	;

stmt_prime_10:stmt_prime_10 IDENTIFIER
	|stmt_prime_10 expr
	|	
	;

stmt_prime_8:stmt_prime_8 IDENTIFIER
	|stmt_prime_8 expr 
	|	
	;

lbr_d4:LBR
	|
        ;

stmt_prime_7:stmt_prime_7 IDENTIFIER
        |stmt_prime_7 expr
	|	
	;

function_statement:FUNC IDENTIFIER paralist_d lbr_stmt_rbr_d2 ENDFUNC Statement
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


#ifdef YYDEBUG
yydebug = 1;
#endif

            
void main()
{
	//printf("\n Enter the expression:\n");
	yyin=fopen("test.txt","r");
        int a = yyparse();
    fclose(yyin);
    /*if(a == 0) {
        printf("-------------------------------\n");
        printf("Variable\tType\n");
        printf("-------------------------------\n");
        printf("%s\t",yylval.str);
        printf("Parsed successfuly!\n");
    } else {
        
        /* yyerror() 
    }*/
  
    return 0;
}


