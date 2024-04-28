%{
	#include <stdio.h>
%}

D [0-9]
INTEIRO {D}+
S [~`!@#$%^&*()_\-+\\/\[\]|'?><,.]
L [A-Za-z]
PALAVRA {L}+
SPACE [[:space:]]
TAB [\t]


%%
inicioprog  { printf("INICIOPROG\n"); }

fimprog     { printf("FIMPROG\n"); }

inicioargs  { printf("INICIOARGS\n"); }

fimargs     { printf("FIMARGS\n"); }

iniciovars  { printf("INICIOVARS\n"); }

fimvars     { printf("FIMVARS\n"); }

escreva     { printf("ESCREVA\n"); }

inteiro     { printf("INTEIRO\n"); }

real        { printf("REAL\n"); }

literal     { printf("LITERAL\n"); }

se          { printf("SE\n"); }

entao       { printf("ENTAO\n"); }

fimse       { printf("FIMSE\n"); }

enquanto    { printf("ENQUANTO\n"); }

faca        { printf("FACA\n"); }

fimenquanto { printf("FIMENQUANTO\n"); }


{D}+(\.{D}+)?((E|e)(\+|-)?{D}+)? 	{ printf("NUMERO\n"); }

(\"({L}|{D}|{S}|{SPACE}|{TAB})*\") 	{ printf("LITERAL\n");}

({L}({L}|{D}|\_)*) 					{ printf("IDENTIFICADOR\n");}

(<|>|>=|<=|==|<>) 					{ printf("OP_RELACIONAL\n");} 

(\+|\-|\*|\/) 						{ printf("OP_ARITMETICO\n");} 

[=] 								{ printf("ATRIBUIÇÃO\n");}

[(]  								{ printf("ABRE_PAR\n");} 

[)]  								{ printf("FECHA_PAR\n");} 

[,]  								{ printf("VIRGULA\n");} 

[;]  								{ printf("PONTO_E_VIRG\n");} 

[[:space:]]+ 						{ printf("VAZIO\n"); }

\{({L}|{D}|{S}|{SPACE}|{TAB})*\} 	{ printf("COMENTARIO\n");} 

<<EOF>> 							{ { printf("FIM_DE_ARQ\n");} }

[[:^space:]]+ 						{ printf("ERRO\n"); }


%%


int main() {
	yylex();
	return 0;

}
