%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
extern FILE *yyin;
extern char arr[100];
extern int i;
%}

%union
{
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
        |expr
        ;

if_statement:IF expr lbr_d stmt_prime_4 elseif_expr_stmt_p else_STMT_d RBR Statement { 
    printf("\nKeyword\t\t%s", $1);
	printf("\nSS\t\t%s",$7);}
	;

for_loop:FOR expr TO expr step_expr_d lbr_d2 STMT_prime_3 RBR Statement { 
	printf("\nKEYWORD\t\t%s", $1);
    printf("\nKEYWORD\t\t%s",$3);
    printf("\nSS\t\t%s",$8);
	}
	;

while_loop:WHILE expr lbr_d4 stmt_prime_7 RBR Statement { 
	printf("\nKEYWORD\t\t%s", $1);
    printf("\nSS\t\t%s",$5);
	}
	;

do_again_loop:DO stmt_prime_8 AGAIN expr Statement { 
    printf("\nKEYWORD\t\t%s",$1);
    printf("\nKEYWORD %s",$3); 
    }	
	;


try_catch_statement:TRY stmt_prime_9 lbr_d5 CATCH stmt_prime_10 RBR Statement { 
	printf("\nKEYWORD\t\t%s",$1);
	printf("\nKEYWORD\t\t%s",$4); 
	printf("\nSS\t\t%s",$6);  
	}	
	;

switch_statement:SWITCH expr lbr_d1 case_expr_statement_p other_STMT_d RBR Statement{ 
	printf("\nKEYWORD\t\t%s",$1);
	printf("\nSS\t\t%s",$6); 
	}	 
	;

package_statement:PACKAGE IDENTIFIER dot_id_p lbr_stmt_rbr_d ENDPACKAGE Statement  { 
	printf("\nKEYWORD\t\t%s",$1);
	printf("\nID\t\t%s",$2); 
	printf("\nKEYWORD\t\t%s",$5);  
	}	  
	;

see_statement:SEE expr Statement{ 
	printf("\nKEYWORD\t\t%s",$1);
	}	
	|SEE LITERAL Statement{ 
	printf("\nKEYWORD\t\t%s",$1);
	printf("\nLITERAL\t\t%s",$2);                     
	}
	;

give_statement:GIVE expr Statement{
	printf("\nKEYWORD\t\t%s",$1);} 
	|GIVE LITERAL Statement{
	printf("\nKEYWORD\t\t%s",$1);
	printf("\nLITERAL\t\t%s",$2);                     
	}
	;

class_statement:CLASS IDENTIFIER from_colon_lt_id_prime lbr_stmt_rbr_d1 ENDCLASS { 
	printf("\nKEYWORD\t\t%s",$1);
	printf("\nID\t\t%s",$2);   
	printf("\nKEYWORD\t\t%s",$5);                  
	}
	;


from_colon_lt_id_prime:FROM IDENTIFIER{ 
	printf("\nKEYWORD\t\t%s",$1);
	printf("\nID\t\t%s",$2);                     
	}
	|	
	;

lbr_stmt_rbr_d1: LBR stmt_prime_2 RBR{ 
	printf("\nSS\t\t%s",$1);
	printf("\nSS\t\t%s",$3);                     
	}
	|
	;

stmt_prime_2:stmt_prime_2 IDENTIFIER{ 
	printf("\nID\t\t%s",$2);                    
	}
	|stmt_prime_2 expr
	|
	;

dot_id_p:DOT IDENTIFIER dot_id_p { 
	printf("\nID\t\t%s",$1);                    
	}
	|	
	;

lbr_stmt_rbr_d:LBR stmt_prime_1 RBR{ 
	printf("\nSS\t\t%s",$1);  
	printf("\nSS\t\t%s",$3);                    
	}
	|
	;

stmt_prime_1:stmt_prime_1 IDENTIFIER{ 
	printf("\nID\t\t%s",$2);               
	}
	|stmt_prime_1 expr
	|	
	;

lbr_d1:LBR{ 
	printf("\nSS\t\t%s",$1);                   
	}
	|
	;

case_expr_statement_p:case_expr_statement_p CASE expr stmt_prime_5	{ 
	printf("\nKEYWORD\t\t%s",$2);                   
	}
	|	
	;

other_STMT_d:OTHER STMT_prime_2{ 
	printf("\nKEYWORD\t\t%s",$1);                   
	}
	|
	;

STMT_prime_2:STMT_prime_2 Statement
	|
	;

stmt_prime_5:stmt_prime_5 IDENTIFIER{ 
	printf("\nID\t\t%s",$2);                    
	}
	|stmt_prime_5 expr
	|	
	;

stmt_prime_9:stmt_prime_9 IDENTIFIER{ 
	printf("\nID\t\t%s",$2);                    
	}
	|stmt_prime_9 expr
	|
	;

lbr_d5:LBR{ 
	printf("\nSS\t\t%s",$1);                    
	}
	|	
	;

stmt_prime_10:stmt_prime_10 IDENTIFIER{ 
	printf("\nID\t\t%s",$2);                    
	}
	|stmt_prime_10 expr
	|	
	;

stmt_prime_8:stmt_prime_8 IDENTIFIER{ 
	printf("\nID\t\t%s",$2);                    
	}
	|stmt_prime_8 expr 
	|	
	;

lbr_d4:LBR{ 
	printf("\nSS\t\t%s",$1);                    
	}
	|
	;

stmt_prime_7:stmt_prime_7 IDENTIFIER{ 
	printf("\nID\t\t%s",$2);                    
	}
	|stmt_prime_7 expr
	|	
	;

function_statement:FUNC IDENTIFIER paralist_d lbr_stmt_rbr_d2 ENDFUNC Statement{ 
	printf("\nKEYWORD\t\t%s",$1);                    
	printf("\nID\t\t%s",$2);
	printf("\nKEYWORD\t\t%s",$5);
	}
	;

paralist_d:lr_d IDENTIFIER COMMA IDENTIFIER rr_d{ 
	printf("\nID\t\t%s",$2);  
	printf("\nSS\t\t%s",$3);  
	printf("\nID\t\t%s",$4);                    
	}
	|
	;

lr_d:LR{ 
	printf("\nSS\t\t%s",$1);                    
	}
    |
    ;

rr_d:RR{ 
	printf("\nSS\t\t%s",$1);                    
	}
    |	
    ;

lbr_stmt_rbr_d2:LBR stmt_prime_3 RBR{ 
	printf("\nSS\t\t%s",$1);  
	printf("\nSS\t\t%s",$3); 
	}                   
	|
	;
stmt_prime_3:stmt_prime_3 IDENTIFIER{ 
	printf("\nID\t\t%s",$2);                     
	}
	|stmt_prime_3 expr
    |	
	;


step_expr_d:STEP expr{ 
	printf("\nKEYWORD\t\t%s",$1);                     
	}
	|
	;

lbr_d2:LBR{ 
	printf("\nSS\t\t%s",$1);                   
	}
	|
	;


STMT_prime_3:STMT_prime_3 Statement
	|
	;
lbr_d:LBR{ 
	printf("\nSS\t\t%s",$1);                   
	}
	|
	;

stmt_prime_4:stmt_prime_4 IDENTIFIER{ 
	printf("\nID\t\t%s",$2);                   
	}
	|stmt_prime_4 expr
	|
	;

elseif_expr_stmt_p:elseif_expr_stmt_p ELSEIF expr STMT_p  { 
	printf("\nKEYWORD\t\t%s",$2);                   
	}   
	|	
	;

STMT_p:STMT_p Statement
	|	
	;

else_STMT_d:ELSE STMT_prime_1  {
	printf("\nKEYWORD\t\t%s",$1);                   
	}                              
	|
	;

STMT_prime_1:STMT_prime_1 Statement
	|	
	;

expr:IDENTIFIER OPERATOR IDENTIFIER	{ 
	printf("\nID\t\t%s",$1); 
	printf("\nOP\t\t%s",$2); 
	printf("\nID\t\t%s",$3);                    
	}
	;
%%
          
void main()
{
	char filename[15];

	printf("Enter filename: ");
	scanf("%s",filename);
	yyin=fopen(filename,"r");
        
    printf("\nType\t\tToken");
	do
	{
		if(yyparse())
 		{
			printf("\nFailure:\n");
			exit(0);
		}
    }while(!feof(yyin));
         
	printf("\nSuccess\n");
    
}

