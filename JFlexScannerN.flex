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
/* Lexical functions */

/* specify that the class will be called Scanner */
%class JflexScanner
%unicode
%line
%public

/*  specifies that fucntion to get the next token is called nextToken */
%function nextToken

/*  return String objects - the actual lexemes */
%type String

/*  returns the String "EOF: at end of file */
%eofval{
return "EOF";
%eofval}

/**
 * Pattern definitions
 */
LANGUAGE_REGION = [A-Z][A-Z]
SENTIMENT_SCORE = -?0.\d\d
DATE = \d{4}-\d{2}-\d{2}
TIME = \d{2}:\d{2}:\d{2}
HASHTAG = #[A-Z a-z]+

%%
/**
 * Lexical rules
 */
{LANGUAGE_REGION}   {return "language/region: " + yytext() + " line " + yyline;}
{SENTIMENT_SCORE}   {return "sentiment score" + yytext() + " line " + yyline;}
{DATE}  {return "date" + yytext() + " line " + yyline;} 
{TIME}  {return "time" + yytext() + " line " + yyline;} 
{HASHTAG}   {return "hashtag" + yytext() + " line " + yyline;} 
