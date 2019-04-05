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
%token TO
%token IN
%token NEXT
%token STEP
%token AGAIN

%token TRY
%token CATCH
%token DONE

%token OFF
%token OK

%token START

%token LITERAL

%token NE
%token LE
%token GE
%token LT
%token GT            
%token EQUAL

%token AND
%token OR
%token XOR
%token NOT

%token EXP

%token INTO
%token BY
%token MODULUS

%token PLUS
%token MINUS




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

%token PARAMETERS
%token OLD_KEYWORD
%token NEW_KEYWORD
%token OLD_OPERATOR
%token NEW_OPERATOR
%define parse.error verbose                                                                   
%%

stmt:program DOLLAR
    ;

program:statement
       ;

statement:PACKAGE IDENTIFIER DOT IDENTIFIER LBR statement RBR END|ENDPACKAGE
         |CLASS IDENTIFIER FROM|COLON|LE IDENTIFIER LBR statement RBR END|ENDCLASS         
         |FUNC|DEF IDENTIFIER paralist LBR statement RBR END|ENDFUNC
         |IMPORT IDENTIFIER DOT IDENTIFIER 
         |PRIVATE
         |LOAD PACKAGE LITERAL
         |LOADSYNTAX LITERAL
         |CHANGE_RING_KEYWORD OLD_KEYWORD NEW_KEYWORD
         |CHANGE_RING_OPERATOR OLD_OPERATOR NEW_OPERATOR
         |SEE|PUT expression
         |GIVE|GET IDENTIFIER
         |IF expression LBR statement BUT|ELSEIF expression statement ELSE statement RBR|OK 
         |SWITCH expression LBR ON|CASE expression statement OTHER statement RBR|OFF
         |FOR IDENTIFIER EQUAL expression TO expression STEP expression LBR statement RBR
         |FOR IDENTIFIER IN expression STEP expression LBR statement RBR     
         |WHILE expression LBR statement RBR    
         |DO statement AGAIN expression
         |TRY statement LBR CATCH statement RBR|END|DONE
         |RETURN expression
         |BYE
         |EXIT
         |LOOP
         |expression
         |
         ;
         

paralist:LR IDENTIFIER COMMA IDENTIFIER RR
        |
        ;

expression:logic_not AND|OR logic_not 
          ;
logic_not:NOT equal_or_not
         ;
equal_or_not:EQUAL|NE compare
            ;
compare:bit_or_xor LT|GT|LE|GE bit_or_xor
       ;

bit_or_xor:bit_and XOR|EXP bit_and
          ;

bit_and:bit_shift AND bit_shift
       ;

bit_shift:arithmetic SHIFT_LEFT|SHIFT_RIGHT arithmetic
         ;

arithmetic:term PLUS|MINUS term
          ;

term:range INTO|BY|MODULUS range
    ;

range:factor COLON factor  
     ;

factor:IDENTIFIER mixer EQUAL expression
       |NUMBER
       |LITERAL
       |COLON IDENTIFIER
       |PLUS factor                 
       |LR expression RR
       |list
       |NEW IDENTIFIER
       |anonymous_function
       |CALL IDENTIFIER DOT IDENTIFIER LR PARAMETERS RR
       ;

list:LSQB expression COMMA expression RSQB
    ;
mixer:DOT IDENTIFIER
     |LSQB expression RSQB
     |LR expression COMMA expression  
     |LBR statement RBR
     ;

anonymous_function:FUNC|DEF|paralist LBR statement RBR
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

