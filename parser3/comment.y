%{
%}


%%
/*|CLASS IDENTIFIER from_colon_lt_id_p lbr_stmt_rbr_d end_endclass_d*/

/*from_colon_lt_id_p:FROM|COLON|LESS_THAN IDENTIFIER
                ;*/

lbr_stmt_rbr_d2:LBR stmt_prime_3 RBR
        |
	;
stmt_prime_3:stmt_prime_3 IDENTIFIER
	|	
	;
comma_id_d:comma_id_p
	|
	;

comma_id_p:comma_id_p COMMA IDENTIFIER
	|
	;




lbr_d1:LBR
      |
      ;

case_expr_statement_p:case_expr_statement_p CASE expr stmt_prime_5	
	|	
	;

stmt_prime_5:stmt_prime_5 IDENTIFIER
	|stmt_prime_5 expr
	|	
	;	

other_STMT_d:stmt_prime_5 Statement
	|
	;

%%
