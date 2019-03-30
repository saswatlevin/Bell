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
%token OTHER
%token CALL
%token CASE
%token ON
%token OFF
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
stmt:statement DOLLAR
    ;

identifier:LETTER|NUMBER
          ;

statement:pack|clas|fnc|impor|privat|lod|lodsyn|give_get_identifier|expr|see_put_expr|switch_stat|identifier
         |
         ;

pack:PACKAGE identifier DOT identifier packself packen
       ; 
packself:LBR statement RBR
        |
        ;

packen:END|ENDPACKAGE
      ;

clas:CLASS identifier clasmidle identifier clasself clasen statement
    ;

clasmidle:FROM|COLON|LT
         |
         ;

clasen:END|ENDCLASS
      |
      ;

clasself:LBR statement RBR
        |
        ;

fnc:fncsta identifier paralist fncself fncen statement
   ;

fncsta:FUNC|DEF
      ;

paralist:LR identifier COMMA identifier RR
        |
        ;

fncself:LBR statement RBR
       |
       ;

fncen:END|ENDFUNC
     |
     ;


impor:IMPORT identifier DOT identifier
     ; 
privat:PRIVATE
      ;

lod:LOAD PACKAGE LITERAL statement
   |LOAD LITERAL statement
   ;
lodsyn:LOADSYNTAX LITERAL statement
      ;



  
see_put_expr:see_put expr statement
            |see_put LITERAL statement
            |see_put LITERAL plus_nl
            |see_put LITERAL plus_literal plus_nl statement
            ;

plus_literal:PLUS identifier
            ;

plus_nl:PLUS NL
       ;

see_put:SEE|PUT
       ;

give_get_identifier:give_get identifier statement
                   ;
give_get:GIVE|GET
        ;


switch_stat:SWITCH expr CASE expr statement OTHER statement OFF statement
           ;


expr:logic_not and_or equal_or_not 
    ;

and_or:AND|OR
      ;

logic_not:NOT equal_or_not
         ;

equal_or_not:not_ne compare
            ;

not_ne:NOT|NE
      ;

compare:bit_or_xor lt_gt_le_ge bit_or_xor 
       ;

lt_gt_le_ge:LT|GT|LE|GE
           ;

bit_or_xor:bit_and bxor_exp bit_and
          ;   

bxor_exp:BXOR|EXP
        ;

bit_and:bit_shift XAND bit_shift 
       ;

bit_shift:arithmetic shift_left_right arithmetic
         ;

shift_left_right:SHIFT_LEFT|SHIFT_RIGHT
                ;
arithmetic:term addop term
          ;

addop:PLUS|MINUS
    ;

term:range mulop range 
    ;

mulop:BY|INTO|MODULUS  
     ;

range:factor COLON factor              
     ;

factor:identifier mixer EQUAL expr
      |NUMBER
      |LITERAL
      |COLON identifier
      |MINUS factor
      |LR expr RR
      |list
      |NEW identifier
      |CALL identifier DOT identifier LR paralist RR
      |anonymous_function
      ;


list:LSQB expr COMMA expr RSQB
    ;

mixer:DOT identifier
     |LSQB expr RSQB
     |LR expr COMMA expr RR
     |LBR statement RBR
     ;                               

anonymous_function:fncsta_paralist LBR statement RBR //nominal performance
                  ;
fncsta_paralist:fncsta|paralist
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
/*EXPR_IDENTIFIER:EXPR|IDENTIFIER
               ;

EQUAL_NE_LE_GE_LT_GT:EQUAL|NE|LE|GE|LT|GT
                    ;

EXPR_ALL:EQUAL_NE_LE_GE_LT_GT EXPR_IDENTIFIER
        ;
        
*/ 
