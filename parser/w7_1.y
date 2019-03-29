%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
extern FILE *yyin;
%}

  //%token PROGRAM
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


%token LETTER
%token NUMBER                  //%token IDENTFIER


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
%token FROM

%token SEE
%token PUT

%token BUT
%token ELSE
%token ELSEIF
%token NEW
%token CALL
%token OK

%token LITERAL

%token EQUAL
%token NE
%token LE
%token GE
%token LT
%token GT

%token AND
%token BXOR
%token OR
%token NOT

%token SHIFT_LEFT
%token SHIFT_RIGHT

%token PLUS
%token MINUS

%token INTO
%token BY
%token MODULUS

%token EXP

%token XAND 



%define parse.error verbose                                                                   
%%
stmt:STATEMENT DOLLAR
    ;

IDENTIFIER:LETTER|NUMBER
          ;

STATEMENT:PACK|CLAS|FNC|IMPOR|PRIVAT|LOD|LODSYN|SEE_PUT_EXPR|GIVE_GET_IDENTIFIER
         |
         ;

PACK:PACKAGE IDENTIFIER DOT IDENTIFIER PACKSELF PACKEN
       ; 
PACKSELF:LBR STATEMENT RBR
        |
        ;

PACKEN:END|ENDPACKAGE
      ;

CLAS:CLASS IDENTIFIER CLASMIDLE IDENTIFIER CLASSELF CLASEN
    ;

CLASMIDLE:FROM|COLON|LT
         |
         ;

CLASEN:END|ENDCLASS
      |
      ;

CLASSELF:LBR STATEMENT RBR
        |
        ;

FNC:FNCSTA IDENTIFIER PARALIST FNCSELF FNCEN
        ;

FNCSTA:FUNC|DEF
      ;

PARALIST:LR IDENTIFIER COMMA IDENTIFIER RR
        |
        ;

FNCSELF:LBR STATEMENT RBR
       |
       ;

FNCEN:END|ENDFUNC
     |
     ;


IMPOR:IMPORT IDENTIFIER DOT IDENTIFIER
     ; 
PRIVAT:PRIVATE
      ;

LOD:LOAD PACKAGE LITERAL STATEMENT
   ;
LODSYN:LOADSYNTAX LITERAL STATEMENT
      ;



  
SEE_PUT_EXPR:SEE_PUT EXPR
            ;
SEE_PUT:SEE|PUT
       ;

GIVE_GET_IDENTIFIER:GIVE_GET IDENTIFIER
                   ;
GIVE_GET:GIVE|GET
        ;

EXPR:LOGIC_NOT AND_OR EQUAL_OR_NOT 
    ;
AND_OR:AND|OR
      ;

LOGIC_NOT:NOT EQUAL_OR_NOT
        ;

EQUAL_OR_NOT:NOT|NE COMPARE
            ;

COMPARE:BIT_OR_XOR LT_GT_LE_GE BIT_OR_XOR 
       ;

LT_GT_LE_GE:LT|GT|LE|GE
           ;

BIT_OR_XOR:BIT_AND BXOR_EXP BIT_AND
          ;   

BXOR_EXP:BXOR|EXP
        ;

BIT_AND:BIT_SHIFT XAND BIT_SHIFT 
       ;

BIT_SHIFT:ARITHMETIC SHIFT_LEFT_RIGHT ARITHMETIC
         ;

SHIFT_LEFT_RIGHT:SHIFT_LEFT|SHIFT_RIGHT
                ;
ARITHMETIC:TERM ADDOP TERM
          ;

ADDOP:PLUS|MINUS
    ;

TERM:RANGE MULOP RANGE 
    ;

MULOP:BY|INTO|MODULUS  
     ;

RANGE:FACTOR COLON FACTOR              
     ;

FACTOR:IDENTIFIER MIXER EQUAL EXPR
      |NUMBER
      |LITERAL
      |COLON IDENTIFIER
      |MINUS FACTOR
      |LR EXPR RR
      |LIST
      |NEW IDENTIFIER
      |CALL IDENTIFIER DOT IDENTIFIER LR PARALIST RR
      |ANONYMOUS_FUNCTION
      ;


LIST:LSQB EXPR COMMA EXPR RSQB
    ;

MIXER:DOT IDENTIFIER
     |LSQB EXPR RSQB
     |LR EXPR COMMA EXPR RR
     |LBR STATEMENT RBR
     ;                               

ANONYMOUS_FUNCTION:FNCSTA_PARALIST LBR STATEMENT RBR //NOMINAL
                  ;
FNCSTA_PARALIST:FNCSTA|PARALIST
               ;
%%

int yyerror(char *msg)
{
	printf("%s\n",msg);
	exit(0);
}

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

