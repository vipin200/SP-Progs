%{
    #include <stdio.h> 
    #include "y.tab.h"
%}

%%

[0-9]*(\.[0-9]+)?	{
          yylval.real = atof(yytext);
          return DIGIT;
        }
[\n]    return NEWLINE;        
.    return *yytext;


%%

yywrap()
{
	return 1;
}