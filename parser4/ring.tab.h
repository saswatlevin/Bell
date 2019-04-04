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

#ifndef YY_YY_RING_TAB_H_INCLUDED
# define YY_YY_RING_TAB_H_INCLUDED
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
    IF = 258,
    ELSE = 259,
    ELSEIF = 260,
    FOR = 261,
    TO = 262,
    STEP = 263,
    FUNC = 264,
    ENDFUNC = 265,
    WHILE = 266,
    END = 267,
    DO = 268,
    AGAIN = 269,
    TRY = 270,
    CATCH = 271,
    SWITCH = 272,
    CASE = 273,
    OTHER = 274,
    PACKAGE = 275,
    DOT = 276,
    ENDPACKAGE = 277,
    SEE = 278,
    LITERAL = 279,
    GIVE = 280,
    CLASS = 281,
    FROM = 282,
    ENDCLASS = 283,
    LOAD = 284,
    IDENTIFIER = 285,
    OPERATOR = 286,
    LBR = 287,
    RBR = 288,
    COMMA = 289,
    LR = 290,
    RR = 291,
    EOP = 292
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 11 "ring.y" /* yacc.c:1909  */

    char *str;

#line 96 "ring.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_RING_TAB_H_INCLUDED  */
