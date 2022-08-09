# CD-lab-programs

## List of programs for CD lab (6th sem)

1a) Write a LEX program to count number of words, lines, characters and whitespaces in a given paragraph.
<br>
1b) Write a YACC program to recognize strings of the form a<sup>n</sup> b<sup>n+m</sup> c<sup>m</sup> | where n,m>=0.

2a) Write a LEX program to count number of Positive and Negative integers and Positive & Negative fractions.
<br>
2b) Write a YACC program to validate and evaluate a simple expression involving operators +,- , * and /.

3a) Write a LEX programto count the number of comment lines in a C Program. Also eliminate them and copy that program into a separate file.
<br>
3b) Write a YACC program to recognize a nested (minimum 3 levels) FOR loop statement for C language.

4a) Write a LEX program to recognize and count the number of identifiers, operators and keywords in a given input file.
<br>
4b) Write a YACC program to recognize nested IF control statements (C language) and display the number of levels of nesting.
<br>
<br>
5) Write a C program to implement a ShiftReduce parser for a given grammar and generate the parsing table by parsing the given string.
(referenced from https://www.geeksforgeeks.org/shift-reduce-parser-compiler/)
<br>
<br>
6) YACC program that reads the C statements for an input file and convert them in quadruple three address intermediate code.
<br>
<br>
7) Write a YACC program that identifies Function Definition of C language.
<br>
<br>
8) Write a YACC program that generates Assembly language (Target) Code for valid Arithmetic Expression.

## Command to run for LEX and YACC program

### Applicable for 1b, 2b, 3b, 4b, 6, 7, 8
<code>
lex file.c && yacc -d file.y &&
cc lex.yy.c y.tab.c -ll -ly && ./a.out
</code>

### Applicable for 1a, 2a, 3a, 4a
<code>
lex file.c &&
cc lex.yy.c && ./a.out
</code>
