/*BUT_ELSEIF:BUT|ELSEIF
          ;

     IF_MIDLE:BUT_ELSEIF EXPR STATEMENT
        ;
   
    IF_ELS:ELSE STATEMENT IF_EN
      ;
    IF_EN:OK|END|RBR
     ;
*/

/*EXPR_ALL:EXPR_IDENTIFIER
        |EQUAL_EXPR_IDENTIFIER
        |NE_EXPR_IDENTIFIER
        |LE_EXPR_IDENTIFIER
        |GE_EXPR_IDENTIFIER
        |GT_EXPR_IDENTIFIER
        |LT_EXPR_IDENTIFIER
        ;*/ 

/*EXPR_IDENTIFIER:EXPR|IDENTIFIER
               ;*/



/*EQUAL_EXPR_IDENTIFIER:EQUAL EXPR_IDENTIFIER
                     ;    

NE_EXPR_IDENTIFIER:NE EXPR_IDENTIFIER
                  ;

LE_EXPR_IDENTIFIER:LE EXPR_IDENTIFIER
                  ;

LT_EXPR_IDENTIFIER:LT EXPR_IDENTIFIER
                  ;

GT_EXPR_IDENTIFIER:GT EXPR_IDENTIFIER
                  ;

GE_EXPR_IDENTIFIER:GE EXPR_IDENTIFIER*/
                  ;
       

/*if_stat:IF identifier EQUAL statement SEE LITERAL PLUS LITERAL PLUS NL ELSEIF statement ELSE statement OK statement
       ;*/