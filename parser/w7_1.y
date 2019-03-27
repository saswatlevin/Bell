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


%token IDENTIFIER


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


%token LITERAL

%token LT
%token GT
%token LE
%token GE


%token AND
%token OR
%token LOGICNOT

%define parse.error verbose                                                                   
%%
stmt:STATEMENT DOLLAR
    ;

STATEMENT:PACK|CLAS
         |FNC|IMPOR|PRIVAT|LOD|LODSYN|SEE_PUT_EXPR|GIVE_GET_IDENTIFIER
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



  
SEE_PUT_EXPR: SEE_PUT EXPR
            ;
SEE_PUT:SEE|PUT
       ;


EXPR:LOGICNOT AND_OR LOGICNOT 
    ;
AND_OR:AND|OR
      ;

GIVE_GET_IDENTIFIER:GIVE_GET IDENTIFIER
                   ;
GIVE_GET:GIVE|GET
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

/*
PACKAGE IDENTIFIER DOT IDENTIFIER LBR STATEMENT RBR END|ENDPACKAGE
         |CLASS IDENTIFIER FROM|COLON|LE IDENTIFIER LBR STATEMENT RBR END|ENDCLASS
         |
*/
