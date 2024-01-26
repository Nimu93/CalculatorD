import std.stdio;
import lexer;
import ast;
import parser;

void print_ast(Ast!Token ast)
{
	writeln(ast);
	if (ast.left)
	{
		print_ast(ast.left);
	}
	if (ast.right)
	{
		print_ast(ast.right);
	}
}

void main()
{
	Token[] lex = lex("1 + 2 + 3");
	foreach (Token t; lex)
	{
		writeln(t);
	}
	print_ast(parse(lex));
}
