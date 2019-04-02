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


%%
