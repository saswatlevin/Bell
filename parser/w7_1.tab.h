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
    DOLLAR = 258,
    NL = 259,
    LBR = 260,
    RBR = 261,
    LSQB = 262,
    RSQB = 263,
    LR = 264,
    RR = 265,
    COMMA = 266,
    COLON = 267,
    SS = 268,
    DOT = 269,
    IDENTIFIER = 270,
    PACKAGE = 271,
    PRIVATE = 272,
    ENDPACKAGE = 273,
    END = 274,
    LOOP = 275,
    CHANGE_RING_OPERATOR = 276,
    CHANGE_RING_KEYWORD = 277,
    IF = 278,
    GET = 279,
    GIVE = 280,
    LOAD = 281,
    LOADSYNTAX = 282,
    FOR = 283,
    WHILE = 284,
    DO = 285,
    RETURN = 286,
    TRY = 287,
    IMPORT = 288,
    EXIT = 289,
    BYE = 290,
    DEF = 291,
    ENDFUNC = 292,
    FUNC = 293,
    SWITCH = 294,
    CLASS = 295,
    ENDCLASS = 296,
    FROM = 297,
    SEE = 298,
    PUT = 299,
    BUT = 300,
    ELSE = 301,
    ELSEIF = 302,
    OK = 303,
    LITERAL = 304,
    EQUAL = 305,
    NE = 306,
    LE = 307,
    GE = 308,
    LT = 309,
    GT = 310,
    AND = 311,
    BXOR = 312,
    OR = 313,
    NOT = 314,
    XAND = 315,
    EXP = 316
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
