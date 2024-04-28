%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%option noyywrap

%{
// Definição de uma estrutura para um símbolo
typedef struct {
    char *lexema;
    char *tipo;
} Simbolo;

// Definição de uma tabela de símbolos
Simbolo tabela_simbolos[1000]; // Suponha que sua tabela de símbolos pode conter até 1000 símbolos
int num_simbolos = 0; // Número atual de símbolos na tabela

// Função para exportar a tabela de símbolos para um arquivo
void exportar_tabela(const char *nome_arquivo) {
    FILE *arquivo = fopen(nome_arquivo, "w");
    if (arquivo == NULL) {
        fprintf(stderr, "Erro ao abrir o arquivo para escrita.\n");
        exit(EXIT_FAILURE);
    }

    // Escrever cabeçalho
    fprintf(arquivo, "Lexema,Tipo\n");

    // Escrever cada entrada da tabela de símbolos no arquivo
    for (int i = 0; i < num_simbolos; i++) {
        fprintf(arquivo, "%s,%s\n", tabela_simbolos[i].lexema, tabela_simbolos[i].tipo);
    }

    fclose(arquivo);
}
%}

D [0-9]
INTEIRO {D}+
S [~`!@#$%^&*()_\-+\\/\[\]|'?><,.]
L [A-Za-z]
PALAVRA {L}+
SPACE [[:space:]]
TAB [\t]

%%


inicioprog  {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "INICIOPROG";
    num_simbolos++;
    printf("INICIOPROG\n");
}

fimprog     {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "FIMPROG";
    num_simbolos++;
    printf("FIMPROG\n");
}

inicioargs  {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "INICIOARGS";
    num_simbolos++;
    printf("INICIOARGS\n");
}

fimargs     {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "FIMARGS";
    num_simbolos++;
    printf("FIMARGS\n");
}

iniciovars  {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "INICIOVARS";
    num_simbolos++;
    printf("INICIOVARS\n");
}

fimvars     {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "FIMVARS";
    num_simbolos++;
    printf("FIMVARS\n");
}

escreva     {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "ESCREVA";
    num_simbolos++;
    printf("ESCREVA\n");
}

inteiro     {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "INTEIRO";
    num_simbolos++;
    printf("INTEIRO\n");
}

real        {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "REAL";
    num_simbolos++;
    printf("REAL\n");
}

literal     {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "LITERAL";
    num_simbolos++;
    printf("LITERAL\n");
}

se          {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "SE";
    num_simbolos++;
    printf("SE\n");
}

entao       {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "ENTAO";
    num_simbolos++;
    printf("ENTAO\n");
}

fimse       {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "FIMSE";
    num_simbolos++;
    printf("FIMSE\n");
}

enquanto    {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "ENQUANTO";
    num_simbolos++;
    printf("ENQUANTO\n");
}

faca        {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "FACA";
    num_simbolos++;
    printf("FACA\n");
}

fimenquanto {
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "FIMENQUANTO";
    num_simbolos++;
    printf("FIMENQUANTO\n");
}


{D}+(\.{D}+)?((E|e)(\+|-)?{D}+)?  {
    // Armazenar o número na tabela de símbolos
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "NUMERO";
    num_simbolos++;
    printf("NUMERO\n");
}

(\"({L}|{D}|{S}|{SPACE}|{TAB})*\")  {
    // Armazenar o literal na tabela de símbolos
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "LITERAL";
    num_simbolos++;
    printf("LITERAL\n");
}

({L}({L}|{D}|\_)*)  {
    // Armazenar o identificador na tabela de símbolos
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "IDENTIFICADOR";
    num_simbolos++;
    printf("IDENTIFICADOR\n");
}

(<|>|>=|<=|==|<>|\+)  {
    // Armazenar o operador relacional na tabela de símbolos
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "OP_RELACIONAL";
    num_simbolos++;
    printf("OP_RELACIONAL\n");
}

(\+|\-|\*|\/)  {
    // Armazenar o operador aritmético na tabela de símbolos
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "OP_ARITMETICO";
    num_simbolos++;
    printf("OP_ARITMETICO\n");
}

[=]  {
    // Armazenar o operador de atribuição na tabela de símbolos
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "ATRIBUICAO";
    num_simbolos++;
    printf("ATRIBUICAO\n");
}

[(]   {
    // Armazenar o abre parêntese na tabela de símbolos
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "ABRE_PAR";
    num_simbolos++;
    printf("ABRE_PAR\n");
}

[)]   {
    // Armazenar o fecha parêntese na tabela de símbolos
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "FECHA_PAR";
    num_simbolos++;
    printf("FECHA_PAR\n");
}

[,]   {
    // Armazenar a vírgula na tabela de símbolos
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "VIRGULA";
    num_simbolos++;
    printf("VIRGULA\n");
}

[;]   {
    // Armazenar o ponto e vírgula na tabela de símbolos
    tabela_simbolos[num_simbolos].lexema = strdup(yytext);
    tabela_simbolos[num_simbolos].tipo = "PONTO_E_VIRG";
    num_simbolos++;
    printf("PONTO_E_VIRG\n");
}

[[:space:]]+ {
    // Ignorar espaços em branco
}

\{({L}|{D}|{S}|{SPACE}|{TAB})*\}  {
    // Ignorar comentários
}

<<EOF>> {
    /*printf("FIM_DE_ARQ\n");*/
    // Exportar a tabela de símbolos para um arquivo
    exportar_tabela("tabela_simbolos.csv");
}

[[:^space:]]+ {
    printf("ERRO\n");
}

%%

int main() {
    // Chame yylex() para iniciar a análise léxica
    yylex();

    // Após a conclusão da análise léxica, exporte a tabela de símbolos
    exportar_tabela("tabela_simbolos.csv");

    return 0;
}