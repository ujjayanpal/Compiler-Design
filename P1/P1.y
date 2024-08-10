%{
#include<stdio.h>
#include<stdlib.h>
// MAP.Hello

#include<string.h>

struct var
{
    char* name;
    char* val;
};

struct map
{
    struct var list[10000];
    int size;

};
    void cons(struct map* m)
    {
        m = (struct map*)malloc(sizeof(struct map));
        m->size = 0;
        return ;
    }

    char* search(char* varName,struct map* m)
    {
        for(int i=0;i<m->size;i++)
        {
            if(strcmp(varName,m->list[i].name)==0) return m->list[i].val;
        }
        return "";
    }

    void add(char* varName, char* varValue,struct map* m)
    {
        for(int i=0;i<m->size;i++)
        {
            if(strcmp(varName,m->list[i].name)==0)
            {
                m->list[i].val = varValue;
                return;
            }
        }
        m->list[m->size].name = varName;
        m->list[m->size].val = varValue;
        m->size++;
        return;
    }
    

// END MAP.h 
#include <string.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;
extern FILE* yyout;
void yyerror(const char* s);
struct map variables;

%}

%union{
    char str[40000];
    char* iname;
}

%token<iname> QUE LEFT1 RIGHT1 LEFT2 RIGHT2 LEFT3 RIGHT3 PUBLIC STATIC VOID MAIN PRINT RETURN IF DO WHILE ELSE TRUE FALSE THIS NEW AND OR NOTEQUAL LESS PLUS MINUS MULTIPLY DIVIDE DOT NOT EQUAL EOL LENGTH DEFINE COMMA EXTENDS INT BOOL STRING CLASS;
%token<iname> INTEGER IDENTIFIER;
%type<iname> LAFRA TyId Goal MainClass TypeDeclaration MethodDeclaration MDt TDt TIt TIt1 TIt2 Type Statement Expression Expressiont Expressiont2 PrimaryExpression MacroDefinition MacroDefStatement Statementt Identifiert MacroDefExpression MacroDefinitiont MDS1 Identifier Integer ;

%start Goal

%%
Goal   :   MacroDefinitiont MainClass TDt {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); printf("%s\n",d); $$=d;}
;
MainClass	:	CLASS Identifier LEFT2 PUBLIC STATIC VOID MAIN LEFT1 STRING LEFT3 RIGHT3 Identifier RIGHT1 LEFT2 PRINT LEFT1 Expression RIGHT1 EOL RIGHT2 RIGHT2
{char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); strcat(d, " "); strcat(d, $6); 
strcat(d, " "); strcat(d, $7); strcat(d, " "); strcat(d, $8); strcat(d, " "); strcat(d, $9); strcat(d, " "); strcat(d, $10); strcat(d, " "); strcat(d, $11);
strcat(d, " "); strcat(d, $12); strcat(d, " "); strcat(d, $13); strcat(d, " "); strcat(d, $14); strcat(d, " "); strcat(d, $15); strcat(d, " "); strcat(d, $16);
strcat(d, " "); strcat(d, $17); strcat(d, " "); strcat(d, $18); strcat(d, " "); strcat(d, $19); strcat(d, " "); strcat(d, $20); strcat(d, " "); strcat(d, $21); /*printf("%s\n",d)*/; $$=d;}
;
TypeDeclaration	:  CLASS Identifier LEFT2 TIt1 MDt RIGHT2   {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); strcat(d, " "); strcat(d, $6); /*printf("%s\n",d)*/; $$=d;}
|	CLASS Identifier EXTENDS Identifier LEFT2 TIt1 MDt RIGHT2
{char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); strcat(d, " "); strcat(d, $6); 
strcat(d, " "); strcat(d, $7); strcat(d, " "); strcat(d, $8); /*printf("%s\n",d)*/; $$=d;}
;
MethodDeclaration	:  PUBLIC TyId LEFT1 TIt2 RIGHT1 LEFT2 TIt1 Statementt RETURN Expression EOL RIGHT2
{char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); strcat(d, " "); strcat(d, $6); 
strcat(d, " "); strcat(d, $7); strcat(d, " "); strcat(d, $8); strcat(d, " "); strcat(d, $9); strcat(d, " "); strcat(d, $10); strcat(d, " "); strcat(d, $11);
strcat(d, " "); strcat(d, $12); /*printf("%s\n",d)*/; $$=d;}
;
MDt : { $$ = strdup(""); }
| MDt MethodDeclaration {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); /*printf("%s\n",d)*/; $$=d;} 
;
TDt : { $$ = strdup(""); }
| TDt TypeDeclaration   {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); /*printf("%s\n",d)*/; $$=d;}
 
;
TIt : { $$ = strdup(""); }
| TIt COMMA TyId  {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
 
;
TIt1 : { $$ = strdup(""); }
| TIt1 TyId EOL    {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}

;
TIt2 : { $$ = strdup(""); }
| TyId TIt  {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2);  /*printf("%s\n",d)*/; $$=d;}

;
Type	:   INT LEFT3 RIGHT3  {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
|	BOOL { $$ = $1; }
|	INT { $$ = $1; }
|	Identifier { $$ = $1; }
;

Statement	:   LEFT2 Statementt RIGHT2   {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
|	PRINT LEFT1 Expression RIGHT1 EOL   {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); /*printf("%s\n",d)*/; $$=d;}
|   LAFRA  {$$ = $1;}

|	IF LEFT1 Expression RIGHT1 Statement   {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); /*printf("%s\n",d)*/; $$=d;}
|	IF LEFT1 Expression RIGHT1 Statement ELSE Statement    {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); strcat(d, " "); strcat(d, $6); 
strcat(d, " "); strcat(d, $7); /*printf("%s\n",d)*/; $$=d;}
|	DO Statement WHILE LEFT1 Expression RIGHT1 EOL    {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); strcat(d, " "); strcat(d, $6); 
strcat(d, " "); strcat(d, $7); /*printf("%s\n",d)*/; $$=d;}
|	WHILE LEFT1 Expression RIGHT1 Statement     {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); /*printf("%s\n",d)*/; $$=d;}
|	Identifier  LEFT1 Expressiont2 RIGHT1 EOL    {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); $$ = search(d, &variables);}
;
LAFRA : Identifier EQUAL Expression EOL    {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); /*printf("%s\n",d)*/; $$=d;}
|	Identifier LEFT3 Expression RIGHT3 EQUAL Expression EOL     {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); strcat(d, " "); strcat(d, $6); strcat(d, " "); strcat(d, $7); /*printf("%s\n",d)*/; $$=d;}
Expression	:   PrimaryExpression AND PrimaryExpression   {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
|	PrimaryExpression OR PrimaryExpression    {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
|	PrimaryExpression NOTEQUAL PrimaryExpression     {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
|	PrimaryExpression LESS PrimaryExpression     {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
|	PrimaryExpression PLUS PrimaryExpression      {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
|	PrimaryExpression MINUS PrimaryExpression      {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
|	PrimaryExpression MULTIPLY PrimaryExpression      {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
|	PrimaryExpression DIVIDE PrimaryExpression      {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
|	PrimaryExpression LEFT3 PrimaryExpression RIGHT3      {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); /*printf("%s\n",d)*/; $$=d;}
|	PrimaryExpression DOT LENGTH      {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
|	PrimaryExpression { $$ = $1; }
|	PrimaryExpression DOT Identifier LEFT1 Expressiont2 RIGHT1    {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); strcat(d, " "); strcat(d, $6); /*printf("%s\n",d)*/; $$=d;}
|	Identifier LEFT1 Expressiont2 RIGHT1     {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); $$ = search(d, &variables);}
;
Expressiont : { $$ = strdup(""); }
|  COMMA Expression Expressiont    {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
;
Expressiont2 : { $$ = strdup(""); }
|  Expression Expressiont     {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); /*printf("%s\n",d)*/; $$=d;} 
;
PrimaryExpression	:   Integer  { $$ = $1; }
|	TRUE  { $$ = $1; }
|	FALSE  { $$ = $1; }
|	Identifier  { $$ = $1; }
|	THIS  { $$ = $1; }
|	NEW INT LEFT3 Expression RIGHT3     {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); /*printf("%s\n",d)*/; $$=d;}
|	NEW Identifier LEFT1 RIGHT1    {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); /*printf("%s\n",d)*/; $$=d;}
|	NOT Expression     {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); /*printf("%s\n",d)*/; $$=d;}
|	LEFT1 Expression RIGHT1       {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;}
;
MacroDefinition	: MacroDefExpression { $$ = $1; }
|	MacroDefStatement { $$ = $1; }
;
MacroDefStatement	:   DEFINE Identifier LEFT1 MDS1 RIGHT1 LEFT2 Statementt  RIGHT2 {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); strcat(d, " "); strcat(d, $6); 
strcat(d, " "); strcat(d, $7); strcat(d, " "); strcat(d, $8); /*printf("%s\n",d)*/; $$=strdup("");char* dd = (char*)malloc(40000*sizeof(char)); strcat(dd, $2);strcat(dd, " ");
strcat(dd, $3);strcat(dd, " "); strcat(dd, $4);strcat(dd, " "); strcat(dd, $5);char* dd1 = (char*)malloc(40000*sizeof(char)); strcat(dd1, $6);strcat(dd1, " "); strcat(dd1, $7);strcat(dd1, " "); strcat(dd1, $8); add(dd, dd1, &variables);}
;
Statementt : { $$ = strdup(""); }
|   Statement Statementt   {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); /*printf("%s\n",d);*/ $$=d;}

;
Identifiert : { $$ = strdup(""); }
|   COMMA Identifier Identifiert    {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); /*printf("%s\n",d)*/; $$=d;} 
;
MacroDefExpression	:  DEFINE Identifier LEFT1 MDS1 RIGHT1 LEFT1 Expression RIGHT1    {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); strcat(d, " "); strcat(d, $3); strcat(d, " "); strcat(d, $4); strcat(d, " "); strcat(d, $5); strcat(d, " "); strcat(d, $6); 
strcat(d, " "); strcat(d, $7); strcat(d, " "); strcat(d, $8); /*printf("%s\n",d)*/; $$=strdup(""); char* dd = (char*)malloc(40000*sizeof(char)); strcat(dd, $2);strcat(dd, " ");
strcat(dd, $3);strcat(dd, " "); strcat(dd, $4);strcat(dd, " "); strcat(dd, $5);char* dd1 = (char*)malloc(40000*sizeof(char)); strcat(dd1, $6);strcat(dd1, " "); strcat(dd1, $7);strcat(dd1, " "); strcat(dd1, $8); add(dd, dd1, &variables);}
;
TyId : Type Identifier {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2);$$=d;}
MacroDefinitiont : { $$ = strdup(""); }
|   MacroDefinition MacroDefinitiont    {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); /*printf("%s\n",d)*/; $$=d;}


;
MDS1 : { $$ = strdup(""); }
|   Identifier Identifiert     {char* d = (char*)malloc(40000*sizeof(char)); strcpy(d, $1); strcat(d," "); strcat(d, $2); /*printf("%s\n",d)*/; $$=d;}
 
;
Identifier	:  IDENTIFIER { $$ = $1; }
;
Integer	:  INTEGER { $$ = $1; }
;



%%

int main()
{

    cons( &variables );

   

    yyparse();
    

    return 0;
}

void yyerror(const char* s)
{
    printf("// Failed to parse macrojava code.");
    exit(1);

}