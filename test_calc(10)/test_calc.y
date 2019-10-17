%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%union{
     float real;
}
%token DIGIT NEWLINE
%left '+' '-'
%left '*' '/'
%right UMINUS
%type  expr DIGIT start;


%%
start : expr NEWLINE  {
                        printf("\nOutput %f \nComplete\n",$1);
                        exit(1);
                      }

expr: expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { if( $3 == 0)
                        {
                            yyerror("Divide by 0");
                        }
                        $$= $1 / $3 ; 
                      }
    | expr '+' expr   { $$ =$1+$3; }
    | expr '-' expr   { $$=$1-$3; }
    | '(' expr ')'    { $$=$2;    }
    | '-' expr %prec UMINUS { $$=-$2; }
    | DIGIT           { $$=$1;    }
    ;
%%

int yyerror(char const *s)
{
    printf("Invalid Expression: %s\n",s);
    return 0;
}
int main()
{
  yyparse();
  return 1;
}
