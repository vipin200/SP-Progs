%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[_a-z][A-Z]+ {  return id;}
[\n] {return NEWLINE;}
.  {return *yytext;}
%%
int yywrap()
{
    return 1;
}