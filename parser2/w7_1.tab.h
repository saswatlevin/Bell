/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_W7_1_TAB_H_INCLUDED
# define YY_YY_W7_1_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    PACKAGE = 258,
    PRIVATE = 259,
    ENDPACKAGE = 260,
    END = 261,
    LOOP = 262,
    CHANGE_RING_OPERATOR = 263,
    CHANGE_RING_KEYWORD = 264,
    IF = 265,
    GET = 266,
    GIVE = 267,
    LOAD = 268,
    LOADSYNTAX = 269,
    FOR = 270,
    WHILE = 271,
    DO = 272,
    RETURN = 273,
    TRY = 274,
    IMPORT = 275,
    EXIT = 276,
    BYE = 277,
    DEF = 278,
    ENDFUNC = 279,
    FUNC = 280,
    SWITCH = 281,
    CLASS = 282,
    ENDCLASS = 283,
    ENDWHILE = 284,
    FROM = 285,
    SEE = 286,
    PUT = 287,
    BUT = 288,
    ELSE = 289,
    ELSEIF = 290,
    NEW = 291,
    OTHER = 292,
    CALL = 293,
    CASE = 294,
    ON = 295,
    OFF = 296,
    OK = 297,
    LITERAL = 298,
    RELOP = 299,
    LOGOP = 300,
    MULOP = 301,
    ADDOP = 302,
    SHIFT_LEFT = 303,
    SHIFT_RIGHT = 304,
    DOLLAR = 305,
    NL = 306,
    LBR = 307,
    RBR = 308,
    LSQB = 309,
    RSQB = 310,
    LR = 311,
    RR = 312,
    COMMA = 313,
    COLON = 314,
    SS = 315,
    DOT = 316,
    NUMBER = 317,
    IDENTIFIER = 318
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_W7_1_TAB_H_INCLUDED  */
