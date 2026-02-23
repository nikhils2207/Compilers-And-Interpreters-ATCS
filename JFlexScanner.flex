package scanner;
/**
* This file defines a simple lexer for the compilers course 2017-2018
* Comment this file
* 
* @author Debby and Nikhil 
* @version 2/23/26
*/
import java.io.*;


%%
/* lexical functions */
/* specify that the class will be called Scanner and the function to get the next
 * token is called nextToken.  
 */
%class JflexScanner
%unicode
%line
%public
%function nextToken
/*  return String objects - the actual lexemes */
/*  returns the String "EOF: at end of file */
%type String
%eofval{
return "EOF";
%eofval}

/**
 * Pattern definitions
 */
 
 

%%
/**
 * lexical rules
 */
[A-Z][A-Z] {return "language/region: " + yytext() + " line " + yyline;}
-?0.\d\d {return "sentiment score" + yytext() + " line " + yyline;}
\d{4}-\d{2}-\d{2} {return "date" + yytext() + " line " + yyline;} 
\d{2}:\d{2}:\d{2} {return "time" + yytext() + " line " + yyline;} 
#[A-Z a-z]+ {return "hashtag" + yytext() + " line " + yyline;} 