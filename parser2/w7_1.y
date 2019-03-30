%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
extern FILE *yyin;
%}

%token PACKAGE
%token PRIVATE
%token ENDPACKAGE
%token END
%token LOOP
%token CHANGE_RING_OPERATOR
%token CHANGE_RING_KEYWORD
%token IF
%token GET
%token GIVE
%token LOAD
%token LOADSYNTAX
%token FOR
%token WHILE
%token DO
%token RETURN
%token TRY
%token IMPORT
%token EXIT
%token BYE
%token DEF  
%token ENDFUNC
%token FUNC
%token SWITCH
%token CLASS
%token ENDCLASS
%token ENDWHILE
%token FROM
%token SEE
%token PUT
%token BUT
%token ELSE
%token ELSEIF
%token NEW
%token OTHER
%token CALL
%token CASE
%token ON
%token OFF
%token OK


%token LITERAL

%token RELOP            
%token LOGOP
%token MULOP
%token ADDOP

%token SHIFT_LEFT
%token SHIFT_RIGHT

%token DOLLAR
%token NL    //new line


%token LBR  
%token RBR

%token LSQB 
%token RSQB

%token LR
%token RR 


%token COMMA 
%token COLON 
%token SS
%token DOT 

%token NUMBER              

%token IDENTIFIER

%define parse.error verbose                                                                   
%%
stmt:program DOLLAR
    ;

program:statement
       ;
statement:packages
         |classes
         |functions
         |import_statement
         |PRIVATE
         |loadsyntaxes
         |load_statement
         |see_statement
         |put_statement
         |expression
         |
         ;

packages:PACKAGE IDENTIFIER DOT IDENTIFIER LBR statement RBR ENDPACKAGE
    ;

classes:CLASS IDENTIFIER from_or IDENTIFIER LBR statement RBR ENDCLASS
    ;

from_or:FROM
       |
       ;

functions:FUNC IDENTIFIER parameter_list LBR statement RBR ENDFUNC
         ;

parameter_list:LR IDENTIFIER COMMA IDENTIFIER RR
              |
              ;

import_statement:IMPORT IDENTIFIER DOT IDENTIFIER 
            ;

load_statement:LOAD PACKAGE LITERAL
       ;

loadsyntaxes:LOADSYNTAX LITERAL
            ;

see_statement:SEE expression statement
             |SEE LITERAL statement
             |SEE LITERAL ADDOP LITERAL ADDOP NL statement
             ;

put_statement:PUT expression
             ;


expression:simple_expression e_dash
          ;

e_dash:RELOP simple_expression
      |
      ;

simple_expression:terminal se_dash
                 ;

se_dash:ADDOP terminal se_dash
       |
       ;
terminal:factor t_dash
        ;

t_dash:MULOP factor t_dash
      |
      ;

factor:IDENTIFIER|NUMBER
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
	yyin=fopen("1.txt","r");
        do{
            if(yyparse())
            {
               printf("\nFailure:\n");
               exit(0);
            }
        }while(!feof(yyin));
         
        printf("\nSuccess\n");
}

