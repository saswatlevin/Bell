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
    LETTER = 270,
    NUMBER = 271,
    PACKAGE = 272,
    PRIVATE = 273,
    ENDPACKAGE = 274,
    END = 275,
    LOOP = 276,
    CHANGE_RING_OPERATOR = 277,
    CHANGE_RING_KEYWORD = 278,
    IF = 279,
    GET = 280,
    GIVE = 281,
    LOAD = 282,
    LOADSYNTAX = 283,
    FOR = 284,
    WHILE = 285,
    DO = 286,
    RETURN = 287,
    TRY = 288,
    IMPORT = 289,
    EXIT = 290,
    BYE = 291,
    DEF = 292,
    ENDFUNC = 293,
    FUNC = 294,
    SWITCH = 295,
    CLASS = 296,
    ENDCLASS = 297,
    FROM = 298,
    SEE = 299,
    PUT = 300,
    BUT = 301,
    ELSE = 302,
    ELSEIF = 303,
    NEW = 304,
    OTHER = 305,
    CALL = 306,
    CASE = 307,
    ON = 308,
    OFF = 309,
    OK = 310,
    LITERAL = 311,
    EQUAL = 312,
    NE = 313,
    LE = 314,
    GE = 315,
    LT = 316,
    GT = 317,
    AND = 318,
    BXOR = 319,
    OR = 320,
    NOT = 321,
    SHIFT_LEFT = 322,
    SHIFT_RIGHT = 323,
    PLUS = 324,
    MINUS = 325,
    INTO = 326,
    BY = 327,
    MODULUS = 328,
    EXP = 329,
    XAND = 330
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
