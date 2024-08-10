%option noyywrap

%{
#include<stdio.h>
#include "P1.tab.h"
%}

%%
<<EOF>>  {return 0;}
"class"   {yylval.iname = strdup(yytext); return CLASS;}
"?"       {yylval.iname = strdup(yytext); return QUE;}
"("       {yylval.iname = strdup(yytext); return LEFT1;}
")"       {yylval.iname = strdup(yytext); return RIGHT1;}
"{"       {yylval.iname = strdup(yytext); return LEFT2;}
"}"       {yylval.iname = strdup(yytext); return RIGHT2;}
"["       {yylval.iname = strdup(yytext); return LEFT3;}
"]"       {yylval.iname = strdup(yytext); return RIGHT3;}
"public"    {yylval.iname = strdup(yytext); return PUBLIC;}
"static"    {yylval.iname = strdup(yytext); return STATIC;}
"void"      {yylval.iname = strdup(yytext); return VOID;}
"main"      {yylval.iname = strdup(yytext); return MAIN;}
"System.out.println"  {yylval.iname = strdup(yytext); return PRINT;}
"String"              {yylval.iname = strdup(yytext); return STRING;}
"extends"             {yylval.iname = strdup(yytext); return EXTENDS;}
"return"              {yylval.iname = strdup(yytext); return RETURN;}
"if"                  {yylval.iname = strdup(yytext); return IF;}
"do"                  {yylval.iname = strdup(yytext); return DO;}
"while"               {yylval.iname = strdup(yytext); return WHILE;}
"else"                {yylval.iname = strdup(yytext); return ELSE;}
"true"                {yylval.iname = strdup(yytext); return TRUE;}
"false"               {yylval.iname = strdup(yytext); return FALSE;}
"this"                {yylval.iname = strdup(yytext); return THIS;}
"new"                 {yylval.iname = strdup(yytext); return NEW;}
"&&"                  {yylval.iname = strdup(yytext); return AND;}
"||"                  {yylval.iname = strdup(yytext); return OR;}
"!="                  {yylval.iname = strdup(yytext); return NOTEQUAL;}
"<="                  {yylval.iname = strdup(yytext); return LESS;}
"+"                   {yylval.iname = strdup(yytext); return PLUS;}
"-"                   {yylval.iname = strdup(yytext); return MINUS;}
"*"                   {yylval.iname = strdup(yytext); return MULTIPLY;}
"/"                   {yylval.iname = strdup(yytext); return DIVIDE;}
"."                   {yylval.iname = strdup(yytext); return DOT;}
"!"                   {yylval.iname = strdup(yytext); return NOT;}
"="                   {yylval.iname = strdup(yytext); return EQUAL;}
";"                   {yylval.iname = strdup(yytext); return EOL;}
"length"              {yylval.iname = strdup(yytext); return LENGTH;}
"boolean"             {yylval.iname = strdup(yytext); return BOOL;}
"int"             {yylval.iname = strdup(yytext); return INT;}
"#define"              {yylval.iname = strdup(yytext); return DEFINE;}
","                    {yylval.iname = strdup(yytext); return COMMA;}

[0-9]*                {yylval.iname = strdup(yytext); return INTEGER;}
[a-zA-Z_][a-zA-Z0-9_]*  {yylval.iname = strdup(yytext); return IDENTIFIER;}
[\t]      {}
" "       {}
[\n]      {}
[\r]      {}
[\f]      {}
"//"[^\n]* 
"/*"[^"*/"]"*/"
.         

%%

