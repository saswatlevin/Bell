%{
%}


%%
/*|CLASS IDENTIFIER from_colon_lt_id_p lbr_stmt_rbr_d end_endclass_d*/

/*from_colon_lt_id_p:FROM|COLON|LESS_THAN IDENTIFIER
                ;*/

expr:logic_not and_or_lnot_d 		
	|logic_not	
	;

and_or_lnot_d:and_or_lnot_p 
	|	
	;

and_or_lnot_p:and_or_lnot_p AND_OR logic_not      //*	
	|
        ;

logic_not:not_d equal_or_not
	|equal_or_not	
	;

not_d:NOT
	|
	;

equal_or_not:eq_neq_d compare
	;

eq_neq_d:ENE
	|
	;

compare:bit_or_xor lt_gt_le_ge_d
	|bit_or_xor	
	;

lt_gt_le_ge_d:lt_gt_le_ge_p RELOP bit_or_xor
	|	
	;

lt_gt_le_ge_p:lt_gt_le_ge_p bit_or_xor
	|
	;


bit_or_xor:bit_and xor_exp_bitand_d
	|bit_and
	;

xor_exp_bitand_d:xor_exp_bitand_p 
	|
	;

xor_exp_bitand_p:xor_exp_bitand_p XOR_EXP bit_and     //*                             
	|
        ;


bit_and:bit_shift and_bitshift_d
	|bit_shift	
        ; 

and_bitshift_d:and_bitshift_p
	|
	;                                //confid pt

and_bitshift_p:and_bitshift_p AND_OR bit_shift
	|
	;

bit_shift:arithmetic ls_rs_arith_d 
	|arithmetic
        ; 


ls_rs_arith_d:ls_rs_arith_p
	|	
	;

ls_rs_arith_p:ls_rs_arith_p SLLR arithmetic                 //*
	|
	;

arithmetic:term plus_minus_term_d                            
	|term
	;

plus_minus_term_d:plus_minus_term_p
	|	
	;

plus_minus_term_p:ADDOP term                                  //*
	|
	;

term:range mult_div_mod_d                                     //*
	|range	  
	;

mult_div_mod_d:mult_div_mod_p
	|
	;

mult_div_mod_p:mult_div_mod_p MULOP term                       //*
	|
	;
range:factor colon_factor_d
	;

colon_factor_d:COLON factor                                   //*
	|
	;

factor:IDENTIFIER mixer_d equal_expr_d
	|IDENTIFIER mixer_d
       	|IDENTIFIER equal_expr_d
	|IDENTIFIER        
	|LITERAL
	|COLON IDENTIFIER	
	|ADDOP factor
	|list	
	|LR expr RR
	|NEW IDENTIFIER			
	|CALL IDENTIFIER dot_id_prime_x LR PARAMETERS RR		
	;

dot_id_prime_x:dot_id_prime_x DOT IDENTIFIER
	|
	;

mixer_d:mixer_p
	|
	;
	
mixer_p:mixer_p mixer
	|
	;

equal_expr_d:ENE expr
	|
	;


list:LSQB expr_comma_expr_d RSQB
	;	

expr_comma_expr_d:expr expr_comma_expr_p 
	|	
	;

expr_comma_expr_p:expr_comma_expr_p COMMA expr 
	|	
	;


mixer:dot_id_prime_x1
	|LSQB expr RSQB	
	|LBR lbr_stmt_rbr_p_x3 RBR	
        ;                                         //* LSQB expr RSQB

dot_id_prime_x1:dot_id_prime_x1 DOT IDENTIFIER
	|	
	;

lbr_stmt_rbr_p_x3:lbr_stmt_rbr_p_x3 Statement
	|	
	;

%%
